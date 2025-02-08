// @ts-check
import { test, expect } from '@playwright/test';
import exp from 'constants';

test('Ensure user can log in to the website', async ({ page }) => {
    await page.goto('https://www.saucedemo.com/');

    const inputUsername = page.locator('#user-name');
    await inputUsername.fill('standard_user');
    await expect(inputUsername).toHaveValue('standard_user');

    const inputPassword = page.locator('#password');
    await inputPassword.fill('secret_sauce');
    await expect(inputPassword).toHaveValue('secret_sauce');
    
    const buttonLogin = page.locator('#login-button');
    await buttonLogin.click();    

    const backpackProduct = page.locator('#add-to-cart-sauce-labs-backpack');
    await expect(backpackProduct).toBeVisible(); //validate user successfully move to homepage
    await backpackProduct.click();

    const bikelightProduct = page.locator('#add-to-cart-sauce-labs-bike-light');
    await bikelightProduct.click();

    const buttonCart = page.locator('#shopping_cart_container > a');
    await buttonCart.click();

    const buttonCheckout = page.locator('#checkout');
    await expect(buttonCheckout).toBeVisible(); //validate user move to checkout page
    await buttonCheckout.click();

    const inputFirstName = page.locator('#first-name');
    await expect(inputFirstName).toBeVisible(); //validate user move to your information page
    await inputFirstName.fill('Adelina');
    await expect(inputFirstName).toHaveValue('Adelina');

    const inputLastName = page.locator('#last-name');
    await inputLastName.fill('Amajida');
    await expect(inputLastName).toHaveValue('Amajida');

    const inputZipCode = page.locator('#postal-code');
    await inputZipCode.fill('55555');
    await expect(inputZipCode).toHaveValue('55555');

    const buttonContinue = page.locator('#continue');
    await buttonContinue.click();

    const buttonFinish = page.locator('#finish');
    await expect(buttonFinish).toBeVisible(); //validate user move to checkout overview
    await buttonFinish.click();

    const buttonBackHome = page.locator('#back-to-products');
    await expect(buttonBackHome).toBeVisible();
    await buttonBackHome.click();

    await expect(buttonCart).toBeVisible(); //validate user redirect back to the homepage

});