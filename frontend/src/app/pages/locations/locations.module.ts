import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LocationsRoutingModule } from './locations-routing.module';
import { LocationsComponent } from './locations.component';
import { NgxPaginationModule } from 'ngx-pagination';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';

@NgModule({
  declarations: [LocationsComponent],
  imports: [
    CommonModule,
    NgxPaginationModule,
    MatProgressSpinnerModule,
    LocationsRoutingModule
  ]
})
export class LocationsModule { }
