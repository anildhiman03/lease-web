import { Component, OnInit } from '@angular/core';
import { LocationsService } from 'src/app/services/locations.service';
import { Location } from 'src/app/models/location.model';

@Component({
  selector: 'app-locations',
  templateUrl: './locations.component.html',
  styleUrls: ['./locations.component.scss']
})
export class LocationsComponent implements OnInit {

  isLoadingResults = true;

  locations: Location[] = [];
  currentPage = 1;
  pageCount = 0;
  totalCount = 0;

  constructor(
    public locationsService: LocationsService
  ) { }

  ngOnInit(): void {
    this.loadData(this.currentPage);
  }

  /**
   * pagination page change
   * @param $event use as pagination
   */
  pageChanged($event) {
    this.currentPage = $event;
    this.loadData(this.currentPage);
  }

  /**
   * @description load location data
   * @param page use for pagination
   */
  loadData(page: number) {
    this.locationsService.list(page).subscribe((response) => {
      if (response) {
        this.locations = response.body;
        this.pageCount = parseInt(response.headers.get('X-Pagination-Page-Count'), 10);
        this.currentPage = parseInt(response.headers.get('X-Pagination-Current-Page'), 10);
        this.totalCount = parseInt(response.headers.get('X-Pagination-Total-Count'), 10);
      }
      this.isLoadingResults = false;
    }, err => {
      console.log(err);
      this.isLoadingResults = false;
    });
  }
}
