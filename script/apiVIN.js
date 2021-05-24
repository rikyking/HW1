const vin_decode_endpoint="https://vindecoder.p.rapidapi.com/decode_vin?vin=";
const key_VIN="084aab18c3mshc078cb02bf17871p17904fjsn26b709b4a9f9";
function onResponse(response){
    return response.json();
}
function onJSONVIN(json){
    console.log(json)
    const dati=json.specification;
    const art=document.querySelector("#contenuti")
    const ul=document.createElement("ul")
    const li1=document.createElement("li")
    const li2=document.createElement("li")
    const li3=document.createElement("li")
    const li4=document.createElement("li")
    const li5=document.createElement("li")
    const li6=document.createElement("li")

    li1.textContent="Produttore: "+dati.make;
    li2.textContent="Modello: "+dati.model;
    li3.textContent="Stile: "+dati.style;
    li4.textContent="Anno produzione: "+dati.year
    li5.textContent="Paese di produzione: "+dati.made_in
    li6.textContent="Posti a sedere: "+dati.standard_seating
    
    ul.appendChild(li1);
    ul.appendChild(li2);
    ul.appendChild(li3);
    ul.appendChild(li4);
    ul.appendChild(li5);
    ul.appendChild(li6);
    art.appendChild(ul);
}
function decodeVIN(event){
    event.preventDefault();
    const inputVIN=document.querySelector("#VIN").value;
    if(!inputVIN){
        alert("Devi inserire un codice VIN");
    }
    const VIN=encodeURIComponent(inputVIN);
    fetch(vin_decode_endpoint+VIN, {
        method: "GET",
        headers: {
            "x-rapidapi-key": key_VIN,
            "x-rapidapi-host": "vindecoder.p.rapidapi.com",
        }
    }).then(onResponse).then(onJSONVIN);
}
const serchVIN=document.querySelector("form");
serchVIN.addEventListener("submit",decodeVIN);

//test 4F2YU09161KM33122

function reload(){
    const sec=document.querySelector("#contenuti");
    sec.innerHTML='';
    document.querySelector("#VIN").value=''
}

const rel=document.querySelector("#reload");
rel.addEventListener("click",reload);
