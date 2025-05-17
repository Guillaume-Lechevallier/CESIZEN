import {ComponentFixture, TestBed} from '@angular/core/testing';

import {ExercicederespirationComponent} from './exercicederespiration.component';

describe('ExercicederespirationComponent', () => {
  let component: ExercicederespirationComponent;
  let fixture: ComponentFixture<ExercicederespirationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ExercicederespirationComponent]
    })
      .compileComponents();

    fixture = TestBed.createComponent(ExercicederespirationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
