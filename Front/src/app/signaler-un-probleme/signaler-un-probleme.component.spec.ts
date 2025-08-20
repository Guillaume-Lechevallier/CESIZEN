import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SignalerUnProblemeComponent } from './signaler-un-probleme.component';

describe('SignalerUnProblemeComponent', () => {
  let component: SignalerUnProblemeComponent;
  let fixture: ComponentFixture<SignalerUnProblemeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [SignalerUnProblemeComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SignalerUnProblemeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
