const recent_reqs = document.querySelector(".recentReqs > ul");
const current_projs = document.querySelector(".currentProj > ul");

function getStatData()
{
    const request = new XMLHttpRequest;
    request.open('GET', 'http://localhost:8000/tech/stats/');
    
    request.onload = () =>
    {
        try
        {
            const data = JSON.parse(request.responseText);
            populateRecentReqs(data);
            populateCurrProjs(data);
            // populateTable(data);
        }
        catch(e)
        {
            console.warn('Could not load JSON data')
        }
    }
    request.send();
}

function populateRecentReqs(json)
{
    while(recent_reqs.firstChild)
    {
        recent_reqs.removeChild(recent_reqs.firstChild);
    }

    for (i in json)
    {
        console.log(json);
    }
}

function populateCurrProjs(json)
{
    while(current_projs.firstChild)
    {
        current_projs.removeChild(current_projs.firstChild);
    }
}

document.addEventListener('DOMContentLoaded', () => { getStatData(); });