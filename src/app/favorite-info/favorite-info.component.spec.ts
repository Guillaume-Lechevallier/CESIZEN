import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FavoriteInfoComponent } from './favorite-info.component';

describe('FavoriteInfoComponent', () => {
  let component: FavoriteInfoComponent;
  let fixture: ComponentFixture<FavoriteInfoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FavoriteInfoComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FavoriteInfoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
