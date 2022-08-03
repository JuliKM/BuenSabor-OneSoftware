import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { rubroProducto } from 'src/app/modelo/rubroProducto';
import { RubroProductoService } from 'src/app/servicios/rubro-producto.service';

@Component({
  selector: 'app-rubro-producto-admin',
  templateUrl: './rubro-producto-admin.component.html',
})
export class RubroProductoAdminComponent implements OnInit {
  
  rubroProducto:rubroProducto = {
    id: 0,
    denominacion: '',
    alta: true
  };
  new = false;
  idRubroProducto: number = 0;
 
  constructor(private servicioRubroProducto:RubroProductoService, private router:Router, private activeRoute:ActivatedRoute) {
    this.activeRoute.params
    .subscribe(
      parametros => {
        this.idRubroProducto = parametros['id'];
        console.log(this.idRubroProducto);
        if(this.idRubroProducto > 0){
          servicioRubroProducto.getRubroProductoXId(this.idRubroProducto)
          .subscribe(rubroInsumoEncontrado => this.rubroProducto = rubroInsumoEncontrado as rubroProducto);
        }else{
          console.log("ES NUEVO");
        }
      }
    );

  }

  ngOnInit() {

  }

  save() {
    if (this.idRubroProducto == 0) {
      console.log('nuevo');
      this.servicioRubroProducto.setRubroProducto(this.rubroProducto)
        .subscribe( (data: any) => {
          console.log(data);
          if(data && data.id){
            this.router.navigate(['/rubroProductos']);
          }
        },
        error => console.error(error));
    } else {
      console.log(`Update ${ this.idRubroProducto }`);
      this.servicioRubroProducto.updateRubroProducto(this.rubroProducto)
      .subscribe( (data: any) => {
        console.log(data);
        if(data){
            this.router.navigate(['/rubroProductos']);
            console.log(data);
          }
        },
        error => console.error(error));
    }
  }


  addNew(formu: NgForm) {
    this.router.navigate(['/rubroProducto-admin']);
    formu.reset({
      id: 0,
      denominacion: '',
      alta: true
    });
  }
}
