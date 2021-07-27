function agregarEpisodio(){
    var fila = document.getElementById("fila");
    var random = Math.random();
    fila.insertAdjacentHTML('beforeend',`
                <div class="row justify-content-center text-center mb-3 align-items-center" id="`+random+`">
    
                <div class="col-sm-3">
                    <label for="nombre_episodio" class="fs-5">Nombre</label>
                    <input type="text" class="form-control" id="nombre_episodio" name="nombre_episodio" required>
                </div>

                
                <div class="col-sm-1">
                    <label for="duracion_episodio" class="fs-5">Duracion</label>
                    <input type="number" class="form-control" id="nombre_episodio" name="duracion_episodio" required>
                </div>
    
                <div class="col-sm-1">
                    <button type="button"  onclick="eliminarEpisodio('`+random+`')">
                        <i class="bi bi-trash-fill"></i>
                    </button>
                </div>
            </div>
`)
}

function eliminarEpisodio(id){
    var idEliminar = document.getElementById(id);
    var eliminar = idEliminar.parentNode;
    eliminar.removeChild(idEliminar);
}

