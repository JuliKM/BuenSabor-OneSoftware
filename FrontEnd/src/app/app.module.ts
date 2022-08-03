import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { HomeComponent } from './components/home/home.component';
import { InsumoComponent } from './components/insumo/insumo.component';
import { ProductoComponent } from './components/producto/producto.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { HttpClientModule } from "@angular/common/http";
import { InsumoAdminComponent } from './components/admin/insumo-admin/insumo-admin.component';
import { ProductoAdminComponent } from './components/admin/producto-admin/producto-admin.component';
import { FormsModule } from '@angular/forms';
import { RubroInsumoComponent } from './components/rubro-insumo/rubro-insumo.component';
import { RubroProductoComponent } from './components/rubro-producto/rubro-producto.component';
import { RubroInsumoAdminComponent } from './components/admin/rubro-insumo-admin/rubro-insumo-admin.component';
import { RubroProductoAdminComponent } from './components/admin/rubro-producto-admin/rubro-producto-admin.component';
import { RubrosComponent } from './components/rubros/rubros.component';

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    HomeComponent,
    InsumoComponent,
    ProductoComponent,
    InsumoAdminComponent,
    ProductoAdminComponent,
    RubroInsumoComponent,
    RubroProductoComponent,
    RubroInsumoAdminComponent,
    RubroProductoAdminComponent,
    RubrosComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
