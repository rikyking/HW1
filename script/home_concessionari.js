function onResponse(response){
    return response.json();
}

function onJSON(json){
    console.log(json);
    const content=document.querySelector("#contents");

    for(let i=0; i<json.length;i++){
        const foto_testo=document.createElement("div");
        const img=document.createElement("img");
        const text=document.createElement("div");
        const h1=document.createElement("h1");
        const p=document.createElement("p");
        const a=document.createElement("a");

        img.src=json[i].url_img;
        h1.textContent=json[i].nome;
        p.textContent=json[i].descrizione;
        a.href="mhw2.php?nome="+json[i].nome;
        a.textContent="Vai";
        a.setAttribute("id",json[i].nome);
        foto_testo.classList.add("foto-testo");
        text.classList.add("testo");
        a.classList.add("button1");
        if(i%2!=0){
            foto_testo.setAttribute("id","inverti");
        }
        text.appendChild(h1);
        text.appendChild(p);
        text.appendChild(a);
        foto_testo.appendChild(img);
        foto_testo.appendChild(text);
        content.appendChild(foto_testo);
    }
}
fetch("fetch_php/home_concessionari.php").then(onResponse).then(onJSON);

function onResponseNome(response){
    console.log(response);
}
