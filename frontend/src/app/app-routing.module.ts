import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DashboardComponent } from './pages/common/layouts/dashboard/dashboard.component';

const routes: Routes = [
  {
    path: 'servers',
    component: DashboardComponent,
    loadChildren: () => import('./pages/servers/servers-routing.module').then(m => m.ServersRoutingModule),
  },
  {
    path: 'locations',
    component: DashboardComponent,
    loadChildren: () => import('./pages/locations/locations.module').then(m => m.LocationsModule),
  },
  { path: '**', redirectTo: '/servers', pathMatch: 'full' },
];


@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
