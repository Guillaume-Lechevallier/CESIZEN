import {ComponentFixture, TestBed} from '@angular/core/testing';

import {OneInfoComponent} from './one-info.component';

describe('OneInfoComponent', () => {
  let component: OneInfoComponent;
  let fixture: ComponentFixture<OneInfoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [OneInfoComponent]
    })
      .compileComponents();

    fixture = TestBed.createComponent(OneInfoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
