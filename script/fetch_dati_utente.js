function onResponse(response){
    return response.json();
}

function onJSON(json){
    console.log(json);
    const art=document.querySelector("#sezione");
    art.innerHTML='';
    art.classList.remove("hidden");
    art.classList.add("sezione");

    const div=document.createElement("div");
    div.classList.add("tabella");

    const tabella=document.createElement("table");
    var tblBody = document.createElement("tbody");
    const tr0=document.createElement("tr");

    var nome0=document.createElement("th")
    const nome0Text=document.createTextNode("Nome")
    nome0.appendChild(nome0Text)
    var modello0=document.createElement("th")
    const modello0Text=document.createTextNode("Modello")
    modello0.appendChild(modello0Text)
    var Prezzo0=document.createElement("th")
    const Prezzo0Text=document.createTextNode("Prezzo")
    Prezzo0.appendChild(Prezzo0Text)
    var conc0=document.createElement("th")
    const conc0Text=document.createTextNode("Presso")
    conc0.appendChild(conc0Text)
    var data0=document.createElement("th");
    const data0Text=document.createTextNode("Data acquisto");
    data0.appendChild(data0Text)

    tr0.appendChild(nome0)
    tr0.appendChild(modello0)
    tr0.appendChild(Prezzo0)
    tr0.appendChild(conc0)
    tr0.appendChild(data0)
    tblBody.appendChild(tr0)
    tr0.id="rigo1";
    var spesaTotale=0;
    for(let i=0; i<json.length; i++){
        if(json.length==1 && json[i].tot==null){
            spesaTotale=0;
            break;
        }
        if(i==json.length-1){
            spesaTotale=parseFloat(json[i].tot).toFixed(2);
            break;
        }
        var row=document.createElement("tr");
        var nome=document.createElement("td");
        const nomeText=document.createTextNode(json[i].nome)
        nome.appendChild(nomeText)
        var modello=document.createElement("td")
        const modelloText=document.createTextNode(json[i].modello)
        modello.appendChild(modelloText)
        var Prezzo=document.createElement("td")
        const prezzoText=document.createTextNode(json[i].prezzo)
        Prezzo.appendChild(prezzoText)
        var conc=document.createElement("td")
        const concText=document.createTextNode(json[i].concessionario)
        conc.appendChild(concText)
        var data=document.createElement("td")
        const dataText=document.createTextNode(json[i].data)
        data.appendChild(dataText)
        
        row.appendChild(nome)
        row.appendChild(modello)
        row.appendChild(Prezzo)
        row.appendChild(conc)
        row.appendChild(data)
        tblBody.appendChild(row)
    }

    tabella.appendChild(tblBody)
    const saldo=document.createElement("h1");
    saldo.textContent="Spesa totale "+spesaTotale+" €";
    div.appendChild(tabella)
    div.appendChild(saldo)
    art.appendChild(div)
}

function onjsonListaAuto(json){
    console.log(json);
    const art=document.querySelector("#sezione");
    art.innerHTML='';
    art.classList.remove("hidden");
    art.classList.add("sezione");
    
    
    /**
     * !PROVA
     */
    const div=document.createElement("div");
    div.classList.add("tabella");

    const tabella=document.createElement("table");
    var tblBody = document.createElement("tbody");
    const tr0=document.createElement("tr");
    var codice0=document.createElement("th")
    const codice0Text=document.createTextNode("Codice")
    codice0.appendChild(codice0Text)
    var nome0=document.createElement("th")
    const nome0Text=document.createTextNode("Nome")
    nome0.appendChild(nome0Text)
    var modello0=document.createElement("th")
    const modello0Text=document.createTextNode("Modello")
    modello0.appendChild(modello0Text)
    var Prezzo0=document.createElement("th")
    const Prezzo0Text=document.createTextNode("Prezzo")
    Prezzo0.appendChild(Prezzo0Text)
    var disp0=document.createElement("th")
    const disp0Text=document.createTextNode("Disponibilità")
    disp0.appendChild(disp0Text)

    tr0.appendChild(codice0)
    tr0.appendChild(nome0)
    tr0.appendChild(modello0)
    tr0.appendChild(Prezzo0)
    tr0.appendChild(disp0)
    tblBody.appendChild(tr0)
    tr0.id="rigo1";
    /**
     * ?CREAZIONE FORM
     */
    const form=document.createElement("form")
    form.action="../fetch_php/compra_veicolo.php"
    form.name="form_acquisti"
    form.method="POST"
    const cf_input=document.createElement("input")
    cf_input.type="text"
    cf_input.placeholder="Codice fiscale"
    cf_input.name="cf_input"
    cf_input.id="CF";
   
    const codice_input=document.createElement("select")
    codice_input.name="codici"
    for(let i=0; i<json.length; i++){
        var row=document.createElement("tr");
        const option=document.createElement("option")
        option.textContent=json[i].codice;
        codice_input.appendChild(option);

        var codice=document.createElement("td");
        const codiceText=document.createTextNode(json[i].codice)
        codice.appendChild(codiceText)
        var nome=document.createElement("td");
        const nomeText=document.createTextNode(json[i].nome)
        nome.appendChild(nomeText)
        var modello=document.createElement("td")
        const modelloText=document.createTextNode(json[i].modello)
        modello.appendChild(modelloText)
        var Prezzo=document.createElement("td")
        const prezzoText=document.createTextNode(json[i].prezzo)
        Prezzo.appendChild(prezzoText)
        var disp=document.createElement("td")
        const dispText=document.createTextNode(json[i].disp)
        disp.appendChild(dispText)
        
        row.appendChild(codice)
        row.appendChild(nome)
        row.appendChild(modello)
        row.appendChild(Prezzo)
        row.appendChild(disp)
        tblBody.appendChild(row)
    }
    const divForm=document.createElement("div")
    divForm.classList.add("loginForm")
    const sub=document.createElement("input");
    sub.type="submit"
    sub.value="Acquista"
    sub.name="submit"
    sub.id="invio"
    const titolo=document.createElement("h1");
    titolo.textContent="Inserisci il tuo codice fiscale e il codice del veicolo da acquisatre"

    form.appendChild(cf_input);
    form.appendChild(codice_input)
    form.appendChild(sub)

    tabella.appendChild(tblBody)
    divForm.appendChild(titolo)
    divForm.appendChild(form);
   
    
    div.appendChild(tabella)
    div.appendChild(divForm)
    art.appendChild(div)
    document.querySelector("#CF").addEventListener("blur",checkCF);
}

function fetchResponse(response) {
    return response.json();
}

function jsonCheckCF(json){
    console.log(json)
    if (json.exists==true) {
        document.querySelector("#invio").disabled = false;
        document.querySelector('#CF').classList.remove('error');
        const titoloErrore=document.querySelector('.loginForm h1');
        titoloErrore.textContent ="Inserisci il tuo codice fiscale e il codice del veicolo da acquisatre";  
    } else {
        document.querySelector("#invio").disabled = true;
        const titoloErrore=document.querySelector('.loginForm h1');
        titoloErrore.textContent ="Il CF non corrisponde a quello dell'utente loggato";  
        document.querySelector('#CF').classList.add("error")
    }
}

function jsonCFSconto(json){
    console.log(json)
    if (json.exists==true) {
        document.querySelector("#invio").disabled = false;
        const titoloErrore=document.querySelector('.loginForm h1');
        titoloErrore.textContent ="Richiedi sconto";  
        document.querySelector('#CF').classList.remove('error');
        document.querySelector("#invio").addEventListener("click",effettuaSconto)
    } else {
        document.querySelector("#invio").disabled = true;
        const titoloErrore=document.querySelector('.loginForm h1');
        titoloErrore.textContent ="Il CF non corrisponde a quello dell'utente loggato o non hai diritto allo sconto";  
        document.querySelector('#CF').classList.add("error")
    }
}

function checkCF(event){
    const input=event.currentTarget;
    console.log(input.value)
    if(!/^[a-zA-Z0-9]{7,7}$/.test(input.value)) {
        alert("CF non valido")
        document.querySelector("#invio").disabled = true;
    } else {
        document.querySelector("#invio").disabled = false;
        fetch("../fetch_php/check_CF_perAcquisto.php?CF="+encodeURIComponent(input.value)).
        then(fetchResponse).then(jsonCheckCF);
    }  
} 
function checkCFSconto(event){
    const input=event.currentTarget;
    console.log(input.value)
    if(!/^[a-zA-Z0-9]{7,7}$/.test(input.value)) {
        alert("CF non valido")
        document.querySelector("#invio").disabled = true;
    } else {
        document.querySelector("#invio").disabled = false;
        fetch("../fetch_php/check_CF_perSconto.php?CF="+encodeURIComponent(input.value)).
        then(fetchResponse).then(jsonCFSconto);
    }  
} 


function acquistiUtente(event){
    fetch("../fetch_php/fetch_dati_utente.php").then(onResponse).then(onJSON);
}

function compraVeicolo(event){
    fetch("../fetch_php/stampaAuto.php").then(onResponse).then(onjsonListaAuto)
}
function effettuaSconto(){
    const input=document.querySelector("#CF").value;
    fetch("../fetch_php/richiediSconto.php?CF="+input);    
}

function richiediSconto(){
    const art=document.querySelector("#sezione");
    art.innerHTML='';
    art.classList.remove("hidden");
    art.classList.add("sezione");
    
    const divForm=document.createElement("div")
    divForm.classList.add("loginForm")
    const form=document.createElement("form")
    form.name="form_acquisti"
    const cf_input=document.createElement("input")
    cf_input.type="text"
    cf_input.placeholder="Codice fiscale"
    cf_input.name="cf_input"
    cf_input.id="CF";
    cf_input.addEventListener("blur",checkCFSconto)
    const sub=document.createElement("input");
    sub.type="submit"
    sub.value="Richiedi"
    sub.name="submit"
    sub.id="invio"
    const h1=document.createElement("h1");
    h1.textContent="Richiedi sconto";
    const p=document.createElement("p");
    p.textContent="Richiedi uno sconto del 15 % se hai meno di 30 anni o del 30 % se hai più di 60 anni";

    form.appendChild(cf_input);
    form.appendChild(sub)
    divForm.appendChild(h1);
    divForm.appendChild(p);
    divForm.appendChild(form)

    art.appendChild(divForm);
}
const button1=document.querySelector("#pulsante1");
button1.addEventListener("click",acquistiUtente)

const button2=document.querySelector("#pulsante2");
button2.addEventListener("click",compraVeicolo)

const button3=document.querySelector("#pulsante3");
button3.addEventListener("click",richiediSconto)
