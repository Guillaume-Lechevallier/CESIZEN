import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Dashboard_questionnaireComponent } from './dashboard_questionnaire.component';

describe('DashboardComponent', () => {
  let component: Dashboard_questionnaireComponent;
  let fixture: ComponentFixture<Dashboard_questionnaireComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Dashboard_questionnaireComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Dashboard_questionnaireComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
