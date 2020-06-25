const rent_table = document.querySelector("#tab1 > tbody");
const projectSelection = document.getElementById('project-selectbox');

function loadEquipments()
{
    const request = new XMLHttpRequest();

    request.open('GET', getEquipmentsURL);
    request.onload = () =>
    {
        try
        {
            const data = JSON.parse(request.responseText);
            populateEquipments(data);
            selectProjectLogic();
        }
        catch(e)
        {
            console.warn('Could not load JSON data')
        }
    };
    request.send();
}

function populateEquipments(json)
{
    //Clears dummy data from table
    while(rent_table.firstChild)
    {
        rent_table.removeChild(rent_table.firstChild);
    }

    //Populate
    json.forEach( (object) =>
    {
        let status = '';
        if(object.broken == 'yes')
        {
            object.broken = 'Broken';
        }
        else
        {
            object.broken = 'Intact';
        }

        const tr = document.createElement("tr");
        tr.innerHTML = "<td data-label=\"Check\"><input type=\"checkbox\" class=\"checkbox\" value=\"" + object.ref + "\"></td>" +
                        "<td data-label=\"#ID\">" + object.ref + "</td>" +
                        "<td data-label=\"Family\">" + object.family + "</td>" +
                        "<td data-label=\"Desc\">" + object.description + "</td>" +
                        "<td data-label=\"Stock\">" + object.total_items + "</td>" +
                        "<td data-label=\"Status\">" + object.broken + "</td>" + 
                        "<td><button class=\"showDialogBtt\" onclick=\"showDialog(" + object.ref + ")\">Show</button></td>";
        rent_table.append(tr);
    });
}

function rentCheckedItems()
{
    var checkboxes = document.getElementsByClassName('checkbox');
    var str = '';

    for(i=0; i < checkboxes.length; i++)
    {
        if(checkboxes[i].checked == true)
        {
            rentItem(checkboxes[i].value);
        }
    }
}

function rentItem(id)
{
    
    console.log(id + projectSelection.innerText);
}

function selectProjectLogic()
{
    const request = new XMLHttpRequest;
    request.open('GET', getProjectsURL);

    request.onload = () =>
    {
        const data = JSON.parse(request.responseText);
        populateProjects(data);
    }

    request.send();
}

function populateProjects(json)
{
    console.log(projectSelection);

    while(projectSelection.firstChild)
    {
        projectSelection.removeChild(projectSelection.firstChild);
    }

    json.forEach( (object) =>
    {

        const option = document.createElement("option");
        option.innerText = object.short_name;
        projectSelection.append(option);
    });
}


document.addEventListener('DOMContentLoaded', () => { loadEquipments(); });