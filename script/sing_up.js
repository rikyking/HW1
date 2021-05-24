function showPassword(event){
    event=event.currentTarget;
    const pass=document.querySelector("#password");
    pass.type="text"
    document.querySelector("#showtext").textContent="Nascondi password"
    event.removeEventListener("click",showPassword);
    event.addEventListener("click",hidePassword);
}
function hidePassword(event){
    event=event.currentTarget;
    const pass=document.querySelector("#password");
    pass.type="password"
    document.querySelector("#showtext").textContent="Mostra password"
    event.removeEventListener("click",hidePassword);
    event.addEventListener("click",showPassword);
}
const show_pass=document.querySelector("#mostra_pass");
show_pass.addEventListener("click",showPassword);

function nascondiInfo(event){
    event=event.currentTarget;
    const req=document.querySelector("#req-box");
    req.classList.add("hidden")
    event.removeEventListener("click",nascondiInfo);
    event.addEventListener("click",mostraInfo);
}

function mostraInfo(event){
    event=event.currentTarget;
    const req=document.querySelector("#req-box");
    req.classList.remove("hidden")
    event.removeEventListener("click",mostraInfo);
    event.addEventListener("click",nascondiInfo)
}

const button=document.querySelector("#info");
button.addEventListener("click",mostraInfo)

function fetchResponse(response) {
    if (!response.ok) return null;
    return response.json();
}

function jsonCheckCF(json){
    if (formStatus.CF = !json.exists) {
        document.querySelector('#idCF').classList.remove('error');
    } else {
        document.querySelector('#idCF .errore').textContent ="Un utente è già registrato con questo CF";   
        document.querySelector('#idCF').classList.add("error")
    }
    checkForm();
}

function jsonCheckUsername(json) {
    if (formStatus.username = !json.exists) {
        document.querySelector('#idUsername').classList.remove('error');
    } else {
        document.querySelector('#idUsername .errore').textContent ="Username già utilizzato";   
        document.querySelector('#idUsername').classList.add("error")
    }
    checkForm();
}

function checkNome(event){
    const input = event.currentTarget;
    if (formStatus[input.name] = /^[a-zA-Z]+$/.test(input.value)) {
        input.parentNode.classList.remove('error');
    } else {
        input.parentNode.classList.add('error');
    }
    checkForm();
}
function checkCognome(event){
    const input = event.currentTarget;
    if (formStatus[input.name] = /^[a-zA-Z]+$/.test(input.value)) {
        input.parentNode.classList.remove('error');
    } else {
        input.parentNode.classList.add('error');
    }
    checkForm();
} 
function checkCompleanno(event){
    const input = event.currentTarget;
    const index=/^\d{4}[-](0?[1-9]|1[012])[-](0?[1-9]|[12][0-9]|3[01])$/;
    if (formStatus[input.name] = index.test(input.value)) {
        input.parentNode.classList.remove('error');
    } else {
        input.parentNode.classList.add('error');
    }
    checkForm();
}

function checkCF(event){
    const input=event.currentTarget;
    if(!/^[a-zA-Z0-9]{7,7}$/.test(input.value)) {
        input.parentNode.classList.add('error');
        formStatus.CF = false;
    } else {
        fetch("../fetch_php/check_CF.php?CF="+encodeURIComponent(input.value)).
        then(fetchResponse).then(jsonCheckCF);
    }  
    checkForm();
} 

function checkUsername(event){
    const input=event.currentTarget;
    if(!/^[a-zA-Z0-9._-]{8,20}$/.test(input.value)) {
        document.querySelector("#idUsername .errore").textContent="Username non valido,deve essere di 8-20"
        input.parentNode.classList.add('error');
        formStatus.username = false;
    } else {
        fetch("../fetch_php/check_username.php?username="+encodeURIComponent(input.value)).
        then(fetchResponse).then(jsonCheckUsername);
    }
    checkForm();
}

function checkPassword(event){
    const input=event.currentTarget;
    var pattern=/^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[_.\-()?#;:!@])[0-9A-Za-z_.\-()?#;:!@]{8,20}$/;
    if(!pattern.test(input.value)) {
        document.querySelector("#idPassword .errore").textContent="La password non rispetta i requisiti, contralla la sezione"
        input.parentNode.classList.add('error');
        formStatus.password = false;
    } else {
        formStatus.password=true;
        input.parentNode.classList.remove('error');
    }
    checkForm();
}

function checkForm() {
    console.log(formStatus)
    if(Object.keys(formStatus).length === 6 && !Object.values(formStatus).includes(false)){
        document.querySelector('input[type="submit"]').disabled=false;
    }
}
const formStatus = {};

document.querySelector('.txt_field #nome').addEventListener('blur', checkNome);
document.querySelector('.txt_field #cognome').addEventListener('blur', checkCognome);
document.querySelector('.txt_field #compleanno').addEventListener('blur', checkCompleanno);
document.querySelector('.txt_field #CF').addEventListener('blur', checkCF);
document.querySelector('.txt_field #username').addEventListener('blur', checkUsername);
document.querySelector('.txt_field #password').addEventListener('blur', checkPassword);
