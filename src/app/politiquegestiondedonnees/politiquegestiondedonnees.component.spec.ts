import {ComponentFixture, TestBed} from '@angular/core/testing';

import {PolitiquegestiondedonneesComponent} from './politiquegestiondedonnees.component';

describe('PolitiquegestiondedonneesComponent', () => {
  let component: PolitiquegestiondedonneesComponent;
  let fixture: ComponentFixture<PolitiquegestiondedonneesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PolitiquegestiondedonneesComponent]
    })
      .compileComponents();

    fixture = TestBed.createComponent(PolitiquegestiondedonneesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
