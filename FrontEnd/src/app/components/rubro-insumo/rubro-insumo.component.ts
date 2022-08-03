import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { rubroInsumo } from 'src/app/modelo/rubroInsumo';
import { RubroInsumoService } from 'src/app/servicios/rubro-insumo.service';

@Component({
  selector: 'app-rubro-insumo',
  templateUrl: './rubro-insumo.component.html',
})
export class RubroInsumoComponent implements OnInit {

  rubroInsumo: rubroInsumo[] = [];
  loading = true;

  constructor(private servicioRubroInsumo:RubroInsumoService, private router:Router, private modalService: NgbModal) { }

  ngOnInit() {

    this.servicioRubroInsumo.getRubroInsumo()
    .subscribe(data => {
      console.log(data);
      for(let ins in data){
        this.rubroInsumo.push(data[ins]);
      }
      this.loading = false;
    });
  }

  delete(idRubroInsumo:number){
    var opcion = confirm("Esta seguro que desea eliminar el Rubro Insumo?");
    if (opcion == true) {
      this.servicioRubroInsumo.deleteRubroInsumo(idRubroInsumo);
      location.reload();
    }
  }
}
