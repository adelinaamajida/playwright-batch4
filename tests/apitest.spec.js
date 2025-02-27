// @ts-check

import { test, expect, request } from '@playwright/test';
const { default: loginAction } = require('../tests/pom/objectAction/loginAction');

test('Test method GET', async ({ page }) => {
    const apiContext = await request.newContext();
    const rest = await apiContext.get('https://reqres.in/api/users?page=2');
    expect(rest.status()).toBe(200);
    const respondJSON = await rest.json();
    expect(respondJSON.page).toBe(2);
    expect(respondJSON.total).toBe(12);
});

test('Test method POST', async ({ page }) => {
    const apiContext = await request.newContext();
    const postData = {
        "name": "morpheus",
        "job": "leader"
    };
    const rest  = await apiContext.post('https://reqres.in/api/users', {
        data : postData
    });
    expect(rest.status()).toBe(201);
    const respondJSON = await rest.json();
    expect(respondJSON.name).toBe('morpheus');
    expect(respondJSON.job).toBe('leader');
});