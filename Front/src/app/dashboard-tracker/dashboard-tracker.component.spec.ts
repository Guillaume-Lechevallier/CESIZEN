import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DashboardTrackerComponent } from './dashboard-tracker.component';

describe('DashboardTrackerComponent', () => {
  let component: DashboardTrackerComponent;
  let fixture: ComponentFixture<DashboardTrackerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DashboardTrackerComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DashboardTrackerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
