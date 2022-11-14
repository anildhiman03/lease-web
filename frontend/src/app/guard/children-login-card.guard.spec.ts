import { TestBed } from '@angular/core/testing';

import { ChildrenLoginCardGuard } from './children-login-card.guard';

describe('ChildrenLoginCardGuard', () => {
  let guard: ChildrenLoginCardGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(ChildrenLoginCardGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
