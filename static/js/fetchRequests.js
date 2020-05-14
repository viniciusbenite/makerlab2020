const pending_request_table = document.querySelector("#tab1 > tbody");
const history_request_table = document.querySelector("#tab2 > tbody");

function loadRequests()
{
    const request = new XMLHttpRequest();

    request.open("get", "http://localhost:8000/tech/requests/?format=json");
    request.onload = () =>
    {
        try
        {
            const data = JSON.parse(request.responseText);
            populateRequests(data);
        }
        catch(e)
        {
            console.warn("Could not load JSON data")
        }
    };
    request.send();
}

function populateRequests(json)
{
    //Clears dummy data from table
    while(pending_request_table.firstChild)
    {
        pending_request_table.removeChild(pending_request_table.firstChild);
    }
    while(history_request_table.firstChild)
    {
        history_request_table.removeChild(history_request_table.firstChild);
    }
    
    //Populate
    json.forEach( (object) =>
    {

        const tr = document.createElement("tr");
        tr.innerHTML =  "<td>" + object.id + "</td>" +
                        "<td>" + object.equipment_ref + "</td>" +
                        "<td>" + object.project_ref + "</td>" +
                        "<td>" + object.timestamp + "</td>"

        if(object.status == "pending")
        {
            const td = document.createElement("td");
            td.innerHTML =  "<td>" +
                            "<button class=\"acceptReq\">&#10003</button>" +
                            "<button class=\"denyReq\">&#10008</button>" +
                            "</td>"
            tr.append(td);
            pending_request_table.append(tr);
        }
        else
        {
            history_request_table.append(tr);
        }
    });
}

document.addEventListener("DOMContentLoaded", () => { loadRequests(); });