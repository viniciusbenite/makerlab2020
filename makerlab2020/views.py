from django.shortcuts import render


# Views for the HTML pages
def homepage(request):
    return render(request, 'index.html')


def about(request):
    return render(request, 'about.html')


def all_equipment(request):
    return render(request, 'all_equipment.html')


def create_project(request):
    return render(request, 'create_project.html')


def nav_bar(request):
    return render(request, 'navbar.html')


def rent_equipment(request):
    return render(request, 'rent_equipment.html')


def return_equipment(request):
    return render(request, 'return_equipment.html')


def student(request):
    return render(request, 'student.html')
