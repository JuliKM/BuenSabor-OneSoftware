import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { rubroProducto } from 'src/app/modelo/rubroProducto';
import { RubroProductoService } from 'src/app/servicios/rubro-producto.service';

@Component({
  selector: 'app-rubro-producto',
  templateUrl: './rubro-producto.component.html',
})
export class RubroProductoComponent implements OnInit {
  
  rubroProducto: rubroProducto[] = [];
  loading = true;

  constructor(private servicioRubroProducto:RubroProductoService, private router:Router, private modalService: NgbModal) { }

  ngOnInit() {

    this.servicioRubroProducto.getRubroProducto()
    .subscribe(data => {
      console.log(data);
      for(let ins in data){
        this.rubroProducto.push(data[ins]);
      }
      this.loading = false;
    });
  }

  delete(idRubroProducto:number){
    var opcion = confirm("Esta seguro que desea eliminar el Rubro Producto?");
    if (opcion == true) {
      this.servicioRubroProducto.deleteRubroProducto(idRubroProducto);
      location.reload();
    }
  }
}
