const edit_eq_table = document.querySelector("#tab1 > tbody");



function loadEquipments()
{
    const xhr = new XMLHttpRequest();

    xhr.open('GET', 'http://localhost:8000/tech/equipments/?format=json');
    xhr.onload = () =>
    {
        try
        {
            const data = JSON.parse(xhr.responseText);
            populateEquipments(data);
        }
        catch(e)
        {
            console.warn('Could not load JSON data')
        }
    };
    xhr.send();
}

function populateEquipments(json)
{
    //Clears dummy data from table
    while(edit_eq_table.firstChild)
    {
        edit_eq_table.removeChild(edit_eq_table.firstChild);
    }

    //Populate
    for(var i in json)
    {
        let status = '';
        if(json[i].broken == 'yes')
        {
            json[i].broken = 'Broken';
        }
        else
        {
            json[i].broken = 'Intact';
        }

        const tr = document.createElement("tr");
        tr.innerHTML = 
                        "<td data-label=\"#ID\">" + json[i].ref + "</td>" +
                        "<td data-label=\"Family\">" + json[i].family + "</td>" +
                        "<td data-label=\"Desc\">" + json[i].description + "</td>" +
                        "<td data-label=\"Stock\">" + json[i].total_items + "</td>" +
                        "<td data-label=\"Status\">" + json[i].broken + "</td>"+
                        "<td data-label=\"Edit\">" + "<button class='editeq' onclick=editEq(" + json[i].ref + ")>&#9998</button>" + "</td>" +
                        "<td data-label=\"Delete\">" + "<button class='deleteeq' onclick=deleteEq(" + json[i].ref + ")>&#10006</button>" + "</td>";
        edit_eq_table.append(tr);
    }
}

function editEq(ref){
    
    document.querySelector(".popup").style.display = "flex";
    document.querySelector(".close" ).addEventListener("click", function(){
        document.querySelector(".popup").style.display = "none";  
    })
    document.getElementById('popup-content').addEventListener('submit', editEqq);
    editEqq(ref);
    
}

function editEqq(ref){
    const xhr = new XMLHttpRequest();

    var data = 
    {
        family: document.getElementById('equipment_family_edit').value,
        ref: document.getElementById('n_ref_edit').value,
        description: document.getElementById('equipment_description_edit').value,
        location: document.getElementById('equipment_location_edit').value,
        total_items: document.getElementById('total_quantity_edit').value,
        borrowed_items: document.getElementById('borrowed_quantity_edit').value,
        price: document.getElementById('price_edit').value
    }
    
    xhr.open('PATCH', 'http://localhost:8000/tech/equipments/' + ref + '/');

    if(data){
         xhr.setRequestHeader('Content-type', 'application/json');
    }
   
    xhr.onload = function(){
        console.log(this.responseText);
    }

    xhr.send(JSON.stringify(data));
}

function deleteEq(ref){
    const xhr = new XMLHttpRequest();
    xhr.open('DELETE', 'http://localhost:8000/tech/equipments/' + ref + '/');

    xhr.send();
    location.reload();
}


document.addEventListener('DOMContentLoaded', () => { loadEquipments(); });