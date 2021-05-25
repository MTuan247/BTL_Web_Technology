<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card">
    <h3 class="card-header" style="margin: 0px">
        Create Product
    </h3>
    <form action="CreateProduct" method="POST">
        <table>
            <tr>
                <td>Product's ID</td>
                <td><input type="text" name="id" value=""></td>
            </tr>
            <tr>
                <td>Product's Name</td>
                <td><input type="text" name="name" value=""></td>
            </tr>
            <tr>
                <td>Image</td>
                <td><input type="text" name="image" value=""></td>
            </tr>
            <tr>
                <td>Description</td>
                <td><input type="text" name="description" value=""></td>
            </tr>

            <tr>
                <td>Price</td>
                <td><input type="text" name="price" value=""></td>
            </tr>
            <tr>
                <td>Sale</td>
                <td><input type="text" name="sale" value=""></td>
            </tr>
            <tr>
                <td>Available</td>
                <td><input type="text" name="available" value=""></td>
            </tr>
            <tr>
                <td>Category ID</td>
                <td><input type="text" name="categoryID" value=""></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit" class="btn-primary">Save</button>
                    <button type="button" onclick="window.location.href='/Admin'" class="btn-cancel">Cancel</button>
                </td>
            </tr>
        </table>
    </form>
</div>
