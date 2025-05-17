import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DeclarerUneEmotionComponent } from './declarer-une-emotion.component';

describe('DeclarerUneEmotionComponent', () => {
  let component: DeclarerUneEmotionComponent;
  let fixture: ComponentFixture<DeclarerUneEmotionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DeclarerUneEmotionComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DeclarerUneEmotionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
