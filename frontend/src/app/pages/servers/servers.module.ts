import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ServersRoutingModule } from './servers-routing.module';
import { ServersComponent } from './servers.component';
import { NgxPaginationModule } from 'ngx-pagination';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { LocationsRoutingModule } from '../locations/locations-routing.module';


@NgModule({
  declarations: [ServersComponent],
  imports: [
    CommonModule,
    ServersRoutingModule,
    NgxPaginationModule,
    MatProgressSpinnerModule,
    LocationsRoutingModule
  ]
})
export class ServersModule { }
