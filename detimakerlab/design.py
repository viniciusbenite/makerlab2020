from django.shortcuts import render

# Views for the HTML pages
from detimakerlab.technician_api.models import Equipments


def homepage(request):
    return render(request, 'index.html')


def about(request):
    return render(request, 'about.html')


########################################################################################
def all_equipment(request):
    data = Equipments.objects.all()
    return render(request, 'all_equipment.html', {"equipmentData": data})


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


def technician(request):
    return render(request, 'technician.html')


def requests(request):
    return render(request, 'requests.html')


def edit_equipment(request):
    return render(request, 'edit_equipment.html')


def statistics(request):

    return render(request, 'statistics.html')


def my_projects(request):
    return render(request, 'my_projects.html')


def team(request):
    return render(request, 'team.html')
