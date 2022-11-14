import { TestBed } from '@angular/core/testing';

import { ChildrenGuestCardGuard } from './children-guest-card.guard';

describe('ChildrenGuestCardGuard', () => {
  let guard: ChildrenGuestCardGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(ChildrenGuestCardGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
