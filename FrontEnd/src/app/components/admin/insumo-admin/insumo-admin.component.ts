import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { insumo } from 'src/app/modelo/insumo';
import { InsumoService } from 'src/app/servicios/insumo.service';

@Component({
  selector: 'app-insumo-admin',
  templateUrl: './insumo-admin.component.html',
})
export class InsumoAdminComponent implements OnInit {

  insumo:insumo = {
    id: 0,
    denominacion: "",
    precio: 0,
    rubro: "",
    imagen: "",
    stockActual: 0,
    stockMinimo: 0,
    unidadMedida: '',
    esInsumo: false,
    alta: true
  };
  new = false;
  idInsumo: number = 0;
  resultadoOperacion = "";

  constructor(private servicioInsumo:InsumoService, private router:Router, private activeRoute:ActivatedRoute) {
    this.activeRoute.params
    .subscribe(
      parametros => {
        this.idInsumo = parametros['id'];
        console.log(this.idInsumo);
        if(this.idInsumo > 0){
          servicioInsumo.getInsumoXId(this.idInsumo)
          .subscribe(insumoEncontrado => this.insumo = insumoEncontrado as insumo);
        }else{
          console.log("ES NUEVO");
        }
      }
    );

  }

  ngOnInit() {

  }

  save() {
    if (this.idInsumo == 0) {
      console.log('nuevo');
      this.servicioInsumo.setInsumo(this.insumo)
        .subscribe( (data: any) => {
          console.log(data);
          if(data && data.id){
            this.router.navigate(['/insumos']);
          }
        },
        error => console.error(error));
    } else {
      console.log(`Update ${ this.idInsumo }`);
      this.servicioInsumo.updateInsumo(this.insumo)
      .subscribe( (data: any) => {
        if(data){
            this.router.navigate(['/insumos']);
          }
        },
        error => console.error(error));
    }
  }


  addNew(formu: NgForm) {
    this.router.navigate(['/insumo-admin']);
    formu.reset({
      id: 0,
      denominacion: "",
      precio: 0,
      rubro: "",
      imagen: "",
      stockActual: 0,
      stockMinimo: 0,
      unidadMedida: '',
      esInsumo: false,
      alta: true
    });
  }

}
