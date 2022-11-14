import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ServersRoutingModule } from './servers-routing.module';
import { ServersComponent } from './servers.component';
import { NgxPaginationModule } from 'ngx-pagination';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import {FormsModule} from '@angular/forms';

@NgModule({
  declarations: [ServersComponent],
  imports: [
    CommonModule,
    FormsModule,
    NgxPaginationModule,
    MatProgressSpinnerModule,
    ServersRoutingModule
  ]
})
export class ServersModule { }
