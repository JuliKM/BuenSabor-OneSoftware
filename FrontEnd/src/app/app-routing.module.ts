import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InsumoAdminComponent } from './components/admin/insumo-admin/insumo-admin.component';
import { ProductoAdminComponent } from './components/admin/producto-admin/producto-admin.component';
import { RubroInsumoAdminComponent } from './components/admin/rubro-insumo-admin/rubro-insumo-admin.component';
import { RubroProductoAdminComponent } from './components/admin/rubro-producto-admin/rubro-producto-admin.component';
import { HomeComponent } from './components/home/home.component';
import { InsumoComponent } from './components/insumo/insumo.component';
import { ProductoComponent } from './components/producto/producto.component';
import { RubroInsumoComponent } from './components/rubro-insumo/rubro-insumo.component';
import { RubroProductoComponent } from './components/rubro-producto/rubro-producto.component';
import { RubrosComponent } from './components/rubros/rubros.component';

const routes: Routes = [ 
  { path: 'home', component: HomeComponent },
  { path: 'insumos', component: InsumoComponent },
  { path: 'insumo-admin/:id', component: InsumoAdminComponent },
  { path: 'productos', component: ProductoComponent },
  { path: 'producto-admin/:id', component: ProductoAdminComponent },
  { path: 'rubros', component: RubrosComponent },
  { path: 'rubroProducto-admin/:id', component: RubroProductoAdminComponent },
  { path: 'rubroInsumo-admin/:id', component: RubroInsumoAdminComponent },
  { path: '**', pathMatch: 'full', redirectTo: 'home' } ];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
