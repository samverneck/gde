from app.models import Categoria
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import make_password
from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect
from django.views.decorators.csrf import csrf_protect
from django.contrib.auth.models import User


@csrf_protect
def cadastroUsuario(request):
    if request.POST:
        username = request.POST.get('username', None)
        password = request.POST.get('password', None)
        email = request.POST.get('email', None)
        nome = request.POST.get('firstname', None)
        sobrenome = request.POST.get('lastname', None)
        user = User.objects.create_user(username, email, password)
        user.first_name = nome
        user.last_name = sobrenome
        user.save()
        if user.is_active:
            return HttpResponseRedirect(request.POST.get('next'))

    return render(request, 'cadastroUsuario.html')


@csrf_protect
@login_required
def home(request):
    return render(request, 'home.html')

@csrf_protect
@login_required
def user_detail(request, pk):
    user = get_object_or_404(User, pk=pk)
    if request.POST:
        username = request.POST.get('username', None)
        password = request.POST.get('password', None)
        email = request.POST.get('email', None)
        nome = request.POST.get('firstname', None)
        sobrenome = request.POST.get('lastname', None)
        user = User.objects.get(id=pk)
        user.username = username
        user.email = email
        if user.password != password:
            user.password = make_password(password)
        user.first_name = nome
        user.last_name = sobrenome
        user.save()
        messages.success(request, 'Os dados foram atualizados com sucesso.')
    return render(request, 'editarUsuario.html', {'user': user})

@csrf_protect
@login_required
def categoria(request):
    if request.POST:
        nome = request.POST.get('nome', None)
        Categoria.objects.create(nome=nome)
    return render(request, 'categoria.html', {})

@csrf_protect
@login_required
def categorias_list(request):
    categorias = Categoria.objects.all
    return render(request, 'categorias_list.html', {'categorias': categorias})

@csrf_protect
@login_required
def categoria_remove(request, pk):
    categoria = get_object_or_404(Categoria, pk=pk)
    categoria.delete()
    return redirect('app.views.categorias_list')

@csrf_protect
@login_required
def categoria_edit(request, pk):
    categoria = get_object_or_404(Categoria, pk=pk)
    if request.POST:
        nome = request.POST.get('nome', None)
        categoria.nome = nome
        categoria.save()
        return HttpResponseRedirect(request.POST.get('next'))
    return render(request, 'editarCategoria.html', {'categoria': categoria})