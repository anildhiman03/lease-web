import { Component, OnInit } from '@angular/core';
import { Server } from 'src/app/models/server.model';
import { ServersService } from 'src/app/services/servers.service';

@Component({
  selector: 'app-servers',
  templateUrl: './servers.component.html',
  styleUrls: ['./servers.component.scss']
})
export class ServersComponent implements OnInit {

  isLoadingResults = true;

  servers: Server[] = [];
  currentPage = 1;
  pageCount = 0;
  totalCount = 0;

  public filters: {
    location: string,
    model: string,
    type: number,
    storage: number,
    ram: string
  } = {
    location: null,
    model: null,
    type: null,
    storage: null,
    ram: null
  };


  constructor(
    public serverLocation: ServersService
  ) { }

  ngOnInit(): void {
    this.loadData(this.currentPage);
  }

  /**
   * pagination page change
   * @param $event use for pagination
   */
  pageChanged($event) {
    this.currentPage = $event;
    this.loadData(this.currentPage);
  }

  /**
   * load data
   * @param page use for pagination
   */
  loadData(page: number) {
    const search = this.urlParams();

    this.serverLocation.list(page, search).subscribe((response) => {
      if (response) {
        this.servers = response.body;
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

  /**
   * Reset question filter
   */
  resetFilter() {
    this.filters = {
      location: null,
      model: null,
      type: null,
      storage: null,
      ram: null
    };
    this.loadData(1); // reload all result
  }

  /**
   * Return url string to filter list
   */
  urlParams() {
    let urlParams = '';

    if (this.filters.location) {
      urlParams += '&location=' + this.filters.location;
    }

    if (this.filters.model) {
      urlParams += '&model=' + this.filters.model;
    }

    if (this.filters.type) {
      urlParams += '&type=' + this.filters.type;
    }
    if (this.filters.storage) {
      urlParams += '&storage=' + this.filters.storage;
    }
    if (this.filters.ram) {
      urlParams += '&ram=' + this.filters.ram;
    }
    return urlParams;
  }
}
