import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { HttpClientModule, HTTP_INTERCEPTORS} from '@angular/common/http';
import { HeaderComponent } from './pages/common/header/header.component';
import { FooterComponent } from './pages/common/footer/footer.component'
import { FlashMessagesModule } from "angular2-flash-messages";
import { ToastrModule } from 'ngx-toastr';
import { TokenInterceptor } from './interceptor/token-interceptor';
import { ErrorInterceptor } from './interceptor/error.interceptor';
import { GuestComponent } from './pages/common/layouts/guest/guest.component';
import { DashboardComponent } from './pages/common/layouts/dashboard/dashboard.component';
import { MyMaterialModule } from './material.module';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,
    GuestComponent,
    DashboardComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    HttpClientModule,
    // MyMaterialModule,
    ToastrModule.forRoot(), // ToastrModule added
    FlashMessagesModule.forRoot(),
  ],
  // providers: [
  //   { provide: HTTP_INTERCEPTORS, useClass: TokenInterceptor, multi: true },
  //   { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true }
  // ],

  bootstrap: [AppComponent]
})
export class AppModule { }
