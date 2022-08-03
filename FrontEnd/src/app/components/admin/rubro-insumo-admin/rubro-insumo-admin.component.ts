import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { rubroInsumo } from 'src/app/modelo/rubroInsumo';
import { RubroInsumoService } from 'src/app/servicios/rubro-insumo.service';

@Component({
  selector: 'app-rubro-insumo-admin',
  templateUrl: './rubro-insumo-admin.component.html',
})
export class RubroInsumoAdminComponent implements OnInit {

  rubroInsumo:rubroInsumo = {
    id: 0,
    denominacion: '',
    alta: true
  };
  new = false;
  idRubroInsumo: number = 0;
 
  constructor(private servicioRubroInsumo:RubroInsumoService, private router:Router, private activeRoute:ActivatedRoute) {
    this.activeRoute.params
    .subscribe(
      parametros => {
        this.idRubroInsumo = parametros['id'];
        console.log(this.idRubroInsumo);
        if(this.idRubroInsumo > 0){
          servicioRubroInsumo.getRubroInsumoXId(this.idRubroInsumo)
          .subscribe(rubroInsumoEncontrado => this.rubroInsumo = rubroInsumoEncontrado as rubroInsumo);
        }else{
          console.log("ES NUEVO");
        }
      }
    );

  }

  ngOnInit() {

  }

  save() {
    if (this.idRubroInsumo == 0) {
      console.log('nuevo');
      this.servicioRubroInsumo.setRubroInsumo(this.rubroInsumo)
        .subscribe( (data: any) => {
          console.log(data);
          if(data && data.id){
            this.router.navigate(['/rubroInsumos']);
          }
        },
        error => console.error(error));
    } else {
      console.log(`Update ${ this.idRubroInsumo }`);
      this.servicioRubroInsumo.updateRubroInsumo(this.rubroInsumo)
      .subscribe( (data: any) => {
        console.log(data);
        if(data){
            this.router.navigate(['/rubroInsumos']);
            console.log(data);
          }
        },
        error => console.error(error));
    }
  }


  addNew(formu: NgForm) {
    this.router.navigate(['/rubro-insumo-admin']);
    formu.reset({
      id: 0,
      denominacion: '',
      alta: true
    });
  }

}
