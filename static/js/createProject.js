function change() {
    var select = document.getElementById("no_team_members");
    var names = document.getElementById("names");
    var value = select.value;
        if (value == 1) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>`;  
            names.innerHTML=toAppend;
            return;
        }
        if (value == 2) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student2_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>`;
            names.innerHTML = toAppend; 
            return;
        }
        if (value == 3) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student2_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student3_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>`;
            names.innerHTML = toAppend;
            return;
        }
        if (value == 4) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student2_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student3_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student4_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>`;
            names.innerHTML = toAppend;
            return;

        }
        if (value == 5) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student2_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student3_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student4_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student5_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>`;
            names.innerHTML = toAppend;
            return;
        }
        if (value == 6) {
            toAppend = `<input type='email' class='project_input' placeholder='Student e-mail' name='student1_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student2_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student3_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student4_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student5_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>
            <input type='email' class='project_input' placeholder='Student e-mail' name='student6_name' pattern=".+@ua.pt" title="Use UA e-mail!" required>`;
            names.innerHTML = toAppend;
            return;
        }
}



document.getElementById('create_project').addEventListener('submit', addProject);

function addProject(){
    const xhr = new XMLHttpRequest();

   /* var checkedValue = new Array(5); 
    var inputElements = document.getElementsByClassName('checkRef');
    for(var i=0; inputElements[i]; ++i){
          if(inputElements[i].checked){
               checkedValue.push(inputElements[i].value);
               break;
          }
    }*/

    var data = 
    {
        code: document.getElementById('project_code').value,
        short_name: document.getElementById('project_short_name').value,
        name: document.getElementById('project_name').value,
        year: document.getElementById('year').value,
        semester: document.getElementById('semester').value,
        equipment: [12]
    }
    
    xhr.open('POST', getProjectsURL);

    if(data){
         xhr.setRequestHeader('Content-type', 'application/json');
    }
   
    xhr.onload = function(){
        console.log(this.responseText);
    }

    xhr.send(JSON.stringify(data));

}

const rent_table = document.querySelector("#tab1 > tbody");

function loadEquipments()
{
    const request = new XMLHttpRequest();

    request.open('GET', getEquipmentsURL + '?format=json');
    request.onload = () =>
    {
        try
        {
            const data = JSON.parse(request.responseText);
            populateEquipments(data);
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
        tr.innerHTML = "<td data-label=\"Check\"><input type=\"checkbox\" value=\"object.ref\" class=\"checkRef\"></td>" +
                        "<td data-label=\"#ID\">" + object.ref + "</td>" +
                        "<td data-label=\"Family\">" + object.family + "</td>" +
                        "<td data-label=\"Desc\">" + object.description + "</td>" +
                        "<td data-label=\"Status\">" + object.broken + "</td>";
        rent_table.append(tr);
    });
}

document.addEventListener('DOMContentLoaded', () => { loadEquipments(); });