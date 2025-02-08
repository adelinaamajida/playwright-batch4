import LoginPage from '../locator/loginPage';
import { expect } from '@playwright/test';

export default class LoginAction {
    constructor(page) {
        this.page = page;
        this.loginPage = new LoginPage();

        this.inputUsername = page.locator(this.loginPage.inputUsername);
        this.inputPassword = page.locator(this.loginPage.inputPassword);
        this.buttonLogin = page.locator(this.loginPage.buttonLogin);
    }

    async goto() {
        await this.page.goto('https://www.saucedemo.com/');
    }
    
    async userLogin() {
        await this.inputUsername.fill('standard_user');
        await expect(this.inputUsername).toHaveValue('standard_user');

        await this.inputPassword.fill('secret_sauce');
        await expect(this.inputPassword).toHaveValue('secret_sauce');

        await this.buttonLogin.click();

    }
}