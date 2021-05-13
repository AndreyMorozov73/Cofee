import pygame
import sys

pygame.init()


class Car():
    '''Класс машинки'''

    def __init__(self, xpos, image_pass):
        self.image = pygame.image.load(image_pass)  # Загрузка изображения
        self.rect = self.image.get_rect()  # Создание прямоугольника
        self.rect.x = xpos  # Задание позиции по иксу
        self.rect.centery = int(screen_heigth / 2)  # Задание позиции по игреку

    def blit(self):
        '''Выводит машинку на экран'''
        screen.blit(self.image, self.rect)


# Параметры экрана
screen_heigth = 1000
screen_width = 1500

# Создание экрана
screen = pygame.display.set_mode((screen_width, screen_heigth))

# Создание экземпляром машинок
car1 = Car(screen_width - 700, 'car.png')
car2 = Car(screen_width - 260, 'car.png')

active = True  # Флаг активности приложения

# Основной цикл
while True:
    # Проверка на выход (нажатие "крестика")
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            sys.exit()

    # Заливка экрана белым цветом
    screen.fill((255, 255, 255))

    if active:
        # Изменение координат машинок
        car1.rect.x -= 1
        car2.rect.x -= 2

        # Проверка столкновения
        if car1.rect.colliderect(car2.rect):
            car2.rect.y += 1
            active = True

    # Отрисовка
    car1.blit()
    car2.blit()
    pygame.display.flip()