import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { producto } from 'src/app/modelo/producto';
import { ProductoService } from 'src/app/servicios/producto.service';

@Component({
  selector: 'app-producto-admin',
  templateUrl: './producto-admin.component.html',
})
export class ProductoAdminComponent implements OnInit {

  producto:producto = {
    id: 0,
    denominacion: '',
    rubro: '',
    tiempoCocina: 0,
    alta: undefined,
    precio: 0,
    imagen: '',
    receta: '',
    descripcion: ''
  };
  new = false;
  idProducto: number = 0;
 
  constructor(private servicioProducto:ProductoService, private router:Router, private activeRoute:ActivatedRoute) {
    this.activeRoute.params
    .subscribe(
      parametros => {
        this.idProducto = parametros['id'];
        console.log(this.idProducto);
        if(this.idProducto > 0){
          servicioProducto.getProductoXId(this.idProducto)
          .subscribe(productoEncontrado => this.producto = productoEncontrado as producto);
        }else{
          console.log("ES NUEVO");
        }
      }
    );

  }

  ngOnInit() {

  }

  save() {
    if (this.idProducto == 0) {
      console.log('nuevo');
      this.servicioProducto.setProducto(this.producto)
        .subscribe( (data: any) => {
          console.log(data);
          if(data && data.id){
            this.router.navigate(['/productos']);
          }
        },
        error => console.error(error));
    } else {
      console.log(`Update ${ this.idProducto }`);
      this.servicioProducto.updateProducto(this.producto)
      .subscribe( (data: any) => {
        console.log(data);
        if(data){
            this.router.navigate(['/productos']);
            console.log(data);
          }
        },
        error => console.error(error));
    }
  }


  addNew(formu: NgForm) {
    this.router.navigate(['/producto-admin']);
    formu.reset({
      id: 0,
      denominacion: '',
      rubro: '',
      tiempoCocina: 0,
      alta: undefined,
      precio: 0,
      imagen: '',
      receta: '',
      descripcion: ''
    });
  }

}
