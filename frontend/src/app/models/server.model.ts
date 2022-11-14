import { Location } from './location.model';

export class Server {
  server_id: number;
  server_model: string;
  server_ram: number;
  server_hard_disk_type: string;
  server_hard_disk_space: number;
  server_price: number;
  server_location_id: number;
  server_created_at: string;
  server_updated_at: string;
  serverLocation: Location;
}
