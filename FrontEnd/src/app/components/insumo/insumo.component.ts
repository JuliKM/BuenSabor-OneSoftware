import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { insumo } from 'src/app/modelo/insumo';
import { InsumoService } from 'src/app/servicios/insumo.service';
import { Pipe, PipeTransform } from '@angular/core';

@Component({
  selector: 'app-insumo',
  templateUrl: './insumo.component.html',
})
export class InsumoComponent implements OnInit {

  insumo: insumo[] = [];
  loading = true;

  constructor(private servicioInsumo:InsumoService, private router:Router, private modalService: NgbModal) { }

  ngOnInit() {

    this.servicioInsumo.getInsumo()
    .subscribe(data => {
      console.log(data);
      for(let ins in data){
        this.insumo.push(data[ins]);
      }
      this.loading = false;
    });
  }

  delete(idInsumo:number){
    var opcion = confirm("Esta seguro que desea eliminar el insumo?");
    if (opcion == true) {
      this.servicioInsumo.deleteInsumo(idInsumo);
      location.reload();
    }
  }
}
