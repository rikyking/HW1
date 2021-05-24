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

function fetchResponse(response) {
    if (!response.ok) return null;
    return response.json();
}
function jsonCheckUsername(json) {
    if (json.exists) {
        document.querySelector("#sub").disabled = false;
        document.querySelector('#idUsername').classList.remove('error');
    } else {
        document.querySelector('#idUsername .errore').textContent ="Username non trovato";   
        document.querySelector('#idUsername').classList.add("error")
        document.querySelector("#sub").disabled = true;
    }
}
function checkUsername(event){
    const input=event.currentTarget;
    fetch("../fetch_php/check_username.php?username="+encodeURIComponent(input.value)).
        then(fetchResponse).then(jsonCheckUsername);
}
document.querySelector('.txt_field #username').addEventListener('blur', checkUsername);