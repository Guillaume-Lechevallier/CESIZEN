import {ComponentFixture, TestBed} from '@angular/core/testing';

import {ReinitialisationpasswordComponent} from './reinitialisationpassword.component';

describe('ReinitialisationpasswordComponent', () => {
  let component: ReinitialisationpasswordComponent;
  let fixture: ComponentFixture<ReinitialisationpasswordComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ReinitialisationpasswordComponent]
    })
      .compileComponents();

    fixture = TestBed.createComponent(ReinitialisationpasswordComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
