package com.metals.utils;

import java.util.List;

import com.metals.pojo.WjGoods;

public class Rows {
    private List<WjGoods> item;

    public void setItem(List<WjGoods> item){
        this.item = item;
    }
    public List<WjGoods> getItem(){
        return this.item;
    }
}