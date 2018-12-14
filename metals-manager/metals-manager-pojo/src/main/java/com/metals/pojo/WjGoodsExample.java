package com.metals.pojo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class WjGoodsExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public WjGoodsExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("Id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("Id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(String value) {
            addCriterion("Id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(String value) {
            addCriterion("Id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(String value) {
            addCriterion("Id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(String value) {
            addCriterion("Id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(String value) {
            addCriterion("Id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(String value) {
            addCriterion("Id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLike(String value) {
            addCriterion("Id like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotLike(String value) {
            addCriterion("Id not like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<String> values) {
            addCriterion("Id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<String> values) {
            addCriterion("Id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(String value1, String value2) {
            addCriterion("Id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(String value1, String value2) {
            addCriterion("Id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andCidIsNull() {
            addCriterion("cId is null");
            return (Criteria) this;
        }

        public Criteria andCidIsNotNull() {
            addCriterion("cId is not null");
            return (Criteria) this;
        }

        public Criteria andCidEqualTo(Long value) {
            addCriterion("cId =", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidNotEqualTo(Long value) {
            addCriterion("cId <>", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidGreaterThan(Long value) {
            addCriterion("cId >", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidGreaterThanOrEqualTo(Long value) {
            addCriterion("cId >=", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidLessThan(Long value) {
            addCriterion("cId <", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidLessThanOrEqualTo(Long value) {
            addCriterion("cId <=", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidIn(List<Long> values) {
            addCriterion("cId in", values, "cid");
            return (Criteria) this;
        }

        public Criteria andCidNotIn(List<Long> values) {
            addCriterion("cId not in", values, "cid");
            return (Criteria) this;
        }

        public Criteria andCidBetween(Long value1, Long value2) {
            addCriterion("cId between", value1, value2, "cid");
            return (Criteria) this;
        }

        public Criteria andCidNotBetween(Long value1, Long value2) {
            addCriterion("cId not between", value1, value2, "cid");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andSpecidIsNull() {
            addCriterion("specId is null");
            return (Criteria) this;
        }

        public Criteria andSpecidIsNotNull() {
            addCriterion("specId is not null");
            return (Criteria) this;
        }

        public Criteria andSpecidEqualTo(Integer value) {
            addCriterion("specId =", value, "specid");
            return (Criteria) this;
        }

        public Criteria andSpecidNotEqualTo(Integer value) {
            addCriterion("specId <>", value, "specid");
            return (Criteria) this;
        }

        public Criteria andSpecidGreaterThan(Integer value) {
            addCriterion("specId >", value, "specid");
            return (Criteria) this;
        }

        public Criteria andSpecidGreaterThanOrEqualTo(Integer value) {
            addCriterion("specId >=", value, "specid");
            return (Criteria) this;
        }

        public Criteria andSpecidLessThan(Integer value) {
            addCriterion("specId <", value, "specid");
            return (Criteria) this;
        }

        public Criteria andSpecidLessThanOrEqualTo(Integer value) {
            addCriterion("specId <=", value, "specid");
            return (Criteria) this;
        }

        public Criteria andSpecidIn(List<Integer> values) {
            addCriterion("specId in", values, "specid");
            return (Criteria) this;
        }

        public Criteria andSpecidNotIn(List<Integer> values) {
            addCriterion("specId not in", values, "specid");
            return (Criteria) this;
        }

        public Criteria andSpecidBetween(Integer value1, Integer value2) {
            addCriterion("specId between", value1, value2, "specid");
            return (Criteria) this;
        }

        public Criteria andSpecidNotBetween(Integer value1, Integer value2) {
            addCriterion("specId not between", value1, value2, "specid");
            return (Criteria) this;
        }

        public Criteria andGkeysIsNull() {
            addCriterion("gkeys is null");
            return (Criteria) this;
        }

        public Criteria andGkeysIsNotNull() {
            addCriterion("gkeys is not null");
            return (Criteria) this;
        }

        public Criteria andGkeysEqualTo(String value) {
            addCriterion("gkeys =", value, "gkeys");
            return (Criteria) this;
        }

        public Criteria andGkeysNotEqualTo(String value) {
            addCriterion("gkeys <>", value, "gkeys");
            return (Criteria) this;
        }

        public Criteria andGkeysGreaterThan(String value) {
            addCriterion("gkeys >", value, "gkeys");
            return (Criteria) this;
        }

        public Criteria andGkeysGreaterThanOrEqualTo(String value) {
            addCriterion("gkeys >=", value, "gkeys");
            return (Criteria) this;
        }

        public Criteria andGkeysLessThan(String value) {
            addCriterion("gkeys <", value, "gkeys");
            return (Criteria) this;
        }

        public Criteria andGkeysLessThanOrEqualTo(String value) {
            addCriterion("gkeys <=", value, "gkeys");
            return (Criteria) this;
        }

        public Criteria andGkeysLike(String value) {
            addCriterion("gkeys like", value, "gkeys");
            return (Criteria) this;
        }

        public Criteria andGkeysNotLike(String value) {
            addCriterion("gkeys not like", value, "gkeys");
            return (Criteria) this;
        }

        public Criteria andGkeysIn(List<String> values) {
            addCriterion("gkeys in", values, "gkeys");
            return (Criteria) this;
        }

        public Criteria andGkeysNotIn(List<String> values) {
            addCriterion("gkeys not in", values, "gkeys");
            return (Criteria) this;
        }

        public Criteria andGkeysBetween(String value1, String value2) {
            addCriterion("gkeys between", value1, value2, "gkeys");
            return (Criteria) this;
        }

        public Criteria andGkeysNotBetween(String value1, String value2) {
            addCriterion("gkeys not between", value1, value2, "gkeys");
            return (Criteria) this;
        }

        public Criteria andSynopsisIsNull() {
            addCriterion("synopsis is null");
            return (Criteria) this;
        }

        public Criteria andSynopsisIsNotNull() {
            addCriterion("synopsis is not null");
            return (Criteria) this;
        }

        public Criteria andSynopsisEqualTo(String value) {
            addCriterion("synopsis =", value, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisNotEqualTo(String value) {
            addCriterion("synopsis <>", value, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisGreaterThan(String value) {
            addCriterion("synopsis >", value, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisGreaterThanOrEqualTo(String value) {
            addCriterion("synopsis >=", value, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisLessThan(String value) {
            addCriterion("synopsis <", value, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisLessThanOrEqualTo(String value) {
            addCriterion("synopsis <=", value, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisLike(String value) {
            addCriterion("synopsis like", value, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisNotLike(String value) {
            addCriterion("synopsis not like", value, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisIn(List<String> values) {
            addCriterion("synopsis in", values, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisNotIn(List<String> values) {
            addCriterion("synopsis not in", values, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisBetween(String value1, String value2) {
            addCriterion("synopsis between", value1, value2, "synopsis");
            return (Criteria) this;
        }

        public Criteria andSynopsisNotBetween(String value1, String value2) {
            addCriterion("synopsis not between", value1, value2, "synopsis");
            return (Criteria) this;
        }

        public Criteria andImageIsNull() {
            addCriterion("Image is null");
            return (Criteria) this;
        }

        public Criteria andImageIsNotNull() {
            addCriterion("Image is not null");
            return (Criteria) this;
        }

        public Criteria andImageEqualTo(String value) {
            addCriterion("Image =", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotEqualTo(String value) {
            addCriterion("Image <>", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageGreaterThan(String value) {
            addCriterion("Image >", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageGreaterThanOrEqualTo(String value) {
            addCriterion("Image >=", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLessThan(String value) {
            addCriterion("Image <", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLessThanOrEqualTo(String value) {
            addCriterion("Image <=", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLike(String value) {
            addCriterion("Image like", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotLike(String value) {
            addCriterion("Image not like", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageIn(List<String> values) {
            addCriterion("Image in", values, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotIn(List<String> values) {
            addCriterion("Image not in", values, "image");
            return (Criteria) this;
        }

        public Criteria andImageBetween(String value1, String value2) {
            addCriterion("Image between", value1, value2, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotBetween(String value1, String value2) {
            addCriterion("Image not between", value1, value2, "image");
            return (Criteria) this;
        }

        public Criteria andPriceIsNull() {
            addCriterion("price is null");
            return (Criteria) this;
        }

        public Criteria andPriceIsNotNull() {
            addCriterion("price is not null");
            return (Criteria) this;
        }

        public Criteria andPriceEqualTo(BigDecimal value) {
            addCriterion("price =", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotEqualTo(BigDecimal value) {
            addCriterion("price <>", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThan(BigDecimal value) {
            addCriterion("price >", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("price >=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThan(BigDecimal value) {
            addCriterion("price <", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThanOrEqualTo(BigDecimal value) {
            addCriterion("price <=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceIn(List<BigDecimal> values) {
            addCriterion("price in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotIn(List<BigDecimal> values) {
            addCriterion("price not in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("price between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("price not between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andIsvouchIsNull() {
            addCriterion("IsVouch is null");
            return (Criteria) this;
        }

        public Criteria andIsvouchIsNotNull() {
            addCriterion("IsVouch is not null");
            return (Criteria) this;
        }

        public Criteria andIsvouchEqualTo(Integer value) {
            addCriterion("IsVouch =", value, "isvouch");
            return (Criteria) this;
        }

        public Criteria andIsvouchNotEqualTo(Integer value) {
            addCriterion("IsVouch <>", value, "isvouch");
            return (Criteria) this;
        }

        public Criteria andIsvouchGreaterThan(Integer value) {
            addCriterion("IsVouch >", value, "isvouch");
            return (Criteria) this;
        }

        public Criteria andIsvouchGreaterThanOrEqualTo(Integer value) {
            addCriterion("IsVouch >=", value, "isvouch");
            return (Criteria) this;
        }

        public Criteria andIsvouchLessThan(Integer value) {
            addCriterion("IsVouch <", value, "isvouch");
            return (Criteria) this;
        }

        public Criteria andIsvouchLessThanOrEqualTo(Integer value) {
            addCriterion("IsVouch <=", value, "isvouch");
            return (Criteria) this;
        }

        public Criteria andIsvouchIn(List<Integer> values) {
            addCriterion("IsVouch in", values, "isvouch");
            return (Criteria) this;
        }

        public Criteria andIsvouchNotIn(List<Integer> values) {
            addCriterion("IsVouch not in", values, "isvouch");
            return (Criteria) this;
        }

        public Criteria andIsvouchBetween(Integer value1, Integer value2) {
            addCriterion("IsVouch between", value1, value2, "isvouch");
            return (Criteria) this;
        }

        public Criteria andIsvouchNotBetween(Integer value1, Integer value2) {
            addCriterion("IsVouch not between", value1, value2, "isvouch");
            return (Criteria) this;
        }

        public Criteria andClicknIsNull() {
            addCriterion("clickN is null");
            return (Criteria) this;
        }

        public Criteria andClicknIsNotNull() {
            addCriterion("clickN is not null");
            return (Criteria) this;
        }

        public Criteria andClicknEqualTo(Integer value) {
            addCriterion("clickN =", value, "clickn");
            return (Criteria) this;
        }

        public Criteria andClicknNotEqualTo(Integer value) {
            addCriterion("clickN <>", value, "clickn");
            return (Criteria) this;
        }

        public Criteria andClicknGreaterThan(Integer value) {
            addCriterion("clickN >", value, "clickn");
            return (Criteria) this;
        }

        public Criteria andClicknGreaterThanOrEqualTo(Integer value) {
            addCriterion("clickN >=", value, "clickn");
            return (Criteria) this;
        }

        public Criteria andClicknLessThan(Integer value) {
            addCriterion("clickN <", value, "clickn");
            return (Criteria) this;
        }

        public Criteria andClicknLessThanOrEqualTo(Integer value) {
            addCriterion("clickN <=", value, "clickn");
            return (Criteria) this;
        }

        public Criteria andClicknIn(List<Integer> values) {
            addCriterion("clickN in", values, "clickn");
            return (Criteria) this;
        }

        public Criteria andClicknNotIn(List<Integer> values) {
            addCriterion("clickN not in", values, "clickn");
            return (Criteria) this;
        }

        public Criteria andClicknBetween(Integer value1, Integer value2) {
            addCriterion("clickN between", value1, value2, "clickn");
            return (Criteria) this;
        }

        public Criteria andClicknNotBetween(Integer value1, Integer value2) {
            addCriterion("clickN not between", value1, value2, "clickn");
            return (Criteria) this;
        }

        public Criteria andReviewnIsNull() {
            addCriterion("reviewN is null");
            return (Criteria) this;
        }

        public Criteria andReviewnIsNotNull() {
            addCriterion("reviewN is not null");
            return (Criteria) this;
        }

        public Criteria andReviewnEqualTo(Integer value) {
            addCriterion("reviewN =", value, "reviewn");
            return (Criteria) this;
        }

        public Criteria andReviewnNotEqualTo(Integer value) {
            addCriterion("reviewN <>", value, "reviewn");
            return (Criteria) this;
        }

        public Criteria andReviewnGreaterThan(Integer value) {
            addCriterion("reviewN >", value, "reviewn");
            return (Criteria) this;
        }

        public Criteria andReviewnGreaterThanOrEqualTo(Integer value) {
            addCriterion("reviewN >=", value, "reviewn");
            return (Criteria) this;
        }

        public Criteria andReviewnLessThan(Integer value) {
            addCriterion("reviewN <", value, "reviewn");
            return (Criteria) this;
        }

        public Criteria andReviewnLessThanOrEqualTo(Integer value) {
            addCriterion("reviewN <=", value, "reviewn");
            return (Criteria) this;
        }

        public Criteria andReviewnIn(List<Integer> values) {
            addCriterion("reviewN in", values, "reviewn");
            return (Criteria) this;
        }

        public Criteria andReviewnNotIn(List<Integer> values) {
            addCriterion("reviewN not in", values, "reviewn");
            return (Criteria) this;
        }

        public Criteria andReviewnBetween(Integer value1, Integer value2) {
            addCriterion("reviewN between", value1, value2, "reviewn");
            return (Criteria) this;
        }

        public Criteria andReviewnNotBetween(Integer value1, Integer value2) {
            addCriterion("reviewN not between", value1, value2, "reviewn");
            return (Criteria) this;
        }

        public Criteria andStocknIsNull() {
            addCriterion("stockN is null");
            return (Criteria) this;
        }

        public Criteria andStocknIsNotNull() {
            addCriterion("stockN is not null");
            return (Criteria) this;
        }

        public Criteria andStocknEqualTo(Integer value) {
            addCriterion("stockN =", value, "stockn");
            return (Criteria) this;
        }

        public Criteria andStocknNotEqualTo(Integer value) {
            addCriterion("stockN <>", value, "stockn");
            return (Criteria) this;
        }

        public Criteria andStocknGreaterThan(Integer value) {
            addCriterion("stockN >", value, "stockn");
            return (Criteria) this;
        }

        public Criteria andStocknGreaterThanOrEqualTo(Integer value) {
            addCriterion("stockN >=", value, "stockn");
            return (Criteria) this;
        }

        public Criteria andStocknLessThan(Integer value) {
            addCriterion("stockN <", value, "stockn");
            return (Criteria) this;
        }

        public Criteria andStocknLessThanOrEqualTo(Integer value) {
            addCriterion("stockN <=", value, "stockn");
            return (Criteria) this;
        }

        public Criteria andStocknIn(List<Integer> values) {
            addCriterion("stockN in", values, "stockn");
            return (Criteria) this;
        }

        public Criteria andStocknNotIn(List<Integer> values) {
            addCriterion("stockN not in", values, "stockn");
            return (Criteria) this;
        }

        public Criteria andStocknBetween(Integer value1, Integer value2) {
            addCriterion("stockN between", value1, value2, "stockn");
            return (Criteria) this;
        }

        public Criteria andStocknNotBetween(Integer value1, Integer value2) {
            addCriterion("stockN not between", value1, value2, "stockn");
            return (Criteria) this;
        }

        public Criteria andOrdernIsNull() {
            addCriterion("orderN is null");
            return (Criteria) this;
        }

        public Criteria andOrdernIsNotNull() {
            addCriterion("orderN is not null");
            return (Criteria) this;
        }

        public Criteria andOrdernEqualTo(Integer value) {
            addCriterion("orderN =", value, "ordern");
            return (Criteria) this;
        }

        public Criteria andOrdernNotEqualTo(Integer value) {
            addCriterion("orderN <>", value, "ordern");
            return (Criteria) this;
        }

        public Criteria andOrdernGreaterThan(Integer value) {
            addCriterion("orderN >", value, "ordern");
            return (Criteria) this;
        }

        public Criteria andOrdernGreaterThanOrEqualTo(Integer value) {
            addCriterion("orderN >=", value, "ordern");
            return (Criteria) this;
        }

        public Criteria andOrdernLessThan(Integer value) {
            addCriterion("orderN <", value, "ordern");
            return (Criteria) this;
        }

        public Criteria andOrdernLessThanOrEqualTo(Integer value) {
            addCriterion("orderN <=", value, "ordern");
            return (Criteria) this;
        }

        public Criteria andOrdernIn(List<Integer> values) {
            addCriterion("orderN in", values, "ordern");
            return (Criteria) this;
        }

        public Criteria andOrdernNotIn(List<Integer> values) {
            addCriterion("orderN not in", values, "ordern");
            return (Criteria) this;
        }

        public Criteria andOrdernBetween(Integer value1, Integer value2) {
            addCriterion("orderN between", value1, value2, "ordern");
            return (Criteria) this;
        }

        public Criteria andOrdernNotBetween(Integer value1, Integer value2) {
            addCriterion("orderN not between", value1, value2, "ordern");
            return (Criteria) this;
        }

        public Criteria andSellersnIsNull() {
            addCriterion("sellersN is null");
            return (Criteria) this;
        }

        public Criteria andSellersnIsNotNull() {
            addCriterion("sellersN is not null");
            return (Criteria) this;
        }

        public Criteria andSellersnEqualTo(Integer value) {
            addCriterion("sellersN =", value, "sellersn");
            return (Criteria) this;
        }

        public Criteria andSellersnNotEqualTo(Integer value) {
            addCriterion("sellersN <>", value, "sellersn");
            return (Criteria) this;
        }

        public Criteria andSellersnGreaterThan(Integer value) {
            addCriterion("sellersN >", value, "sellersn");
            return (Criteria) this;
        }

        public Criteria andSellersnGreaterThanOrEqualTo(Integer value) {
            addCriterion("sellersN >=", value, "sellersn");
            return (Criteria) this;
        }

        public Criteria andSellersnLessThan(Integer value) {
            addCriterion("sellersN <", value, "sellersn");
            return (Criteria) this;
        }

        public Criteria andSellersnLessThanOrEqualTo(Integer value) {
            addCriterion("sellersN <=", value, "sellersn");
            return (Criteria) this;
        }

        public Criteria andSellersnIn(List<Integer> values) {
            addCriterion("sellersN in", values, "sellersn");
            return (Criteria) this;
        }

        public Criteria andSellersnNotIn(List<Integer> values) {
            addCriterion("sellersN not in", values, "sellersn");
            return (Criteria) this;
        }

        public Criteria andSellersnBetween(Integer value1, Integer value2) {
            addCriterion("sellersN between", value1, value2, "sellersn");
            return (Criteria) this;
        }

        public Criteria andSellersnNotBetween(Integer value1, Integer value2) {
            addCriterion("sellersN not between", value1, value2, "sellersn");
            return (Criteria) this;
        }

        public Criteria andSellingnIsNull() {
            addCriterion("sellingN is null");
            return (Criteria) this;
        }

        public Criteria andSellingnIsNotNull() {
            addCriterion("sellingN is not null");
            return (Criteria) this;
        }

        public Criteria andSellingnEqualTo(Integer value) {
            addCriterion("sellingN =", value, "sellingn");
            return (Criteria) this;
        }

        public Criteria andSellingnNotEqualTo(Integer value) {
            addCriterion("sellingN <>", value, "sellingn");
            return (Criteria) this;
        }

        public Criteria andSellingnGreaterThan(Integer value) {
            addCriterion("sellingN >", value, "sellingn");
            return (Criteria) this;
        }

        public Criteria andSellingnGreaterThanOrEqualTo(Integer value) {
            addCriterion("sellingN >=", value, "sellingn");
            return (Criteria) this;
        }

        public Criteria andSellingnLessThan(Integer value) {
            addCriterion("sellingN <", value, "sellingn");
            return (Criteria) this;
        }

        public Criteria andSellingnLessThanOrEqualTo(Integer value) {
            addCriterion("sellingN <=", value, "sellingn");
            return (Criteria) this;
        }

        public Criteria andSellingnIn(List<Integer> values) {
            addCriterion("sellingN in", values, "sellingn");
            return (Criteria) this;
        }

        public Criteria andSellingnNotIn(List<Integer> values) {
            addCriterion("sellingN not in", values, "sellingn");
            return (Criteria) this;
        }

        public Criteria andSellingnBetween(Integer value1, Integer value2) {
            addCriterion("sellingN between", value1, value2, "sellingn");
            return (Criteria) this;
        }

        public Criteria andSellingnNotBetween(Integer value1, Integer value2) {
            addCriterion("sellingN not between", value1, value2, "sellingn");
            return (Criteria) this;
        }

        public Criteria andPromotionnIsNull() {
            addCriterion("promotionN is null");
            return (Criteria) this;
        }

        public Criteria andPromotionnIsNotNull() {
            addCriterion("promotionN is not null");
            return (Criteria) this;
        }

        public Criteria andPromotionnEqualTo(Integer value) {
            addCriterion("promotionN =", value, "promotionn");
            return (Criteria) this;
        }

        public Criteria andPromotionnNotEqualTo(Integer value) {
            addCriterion("promotionN <>", value, "promotionn");
            return (Criteria) this;
        }

        public Criteria andPromotionnGreaterThan(Integer value) {
            addCriterion("promotionN >", value, "promotionn");
            return (Criteria) this;
        }

        public Criteria andPromotionnGreaterThanOrEqualTo(Integer value) {
            addCriterion("promotionN >=", value, "promotionn");
            return (Criteria) this;
        }

        public Criteria andPromotionnLessThan(Integer value) {
            addCriterion("promotionN <", value, "promotionn");
            return (Criteria) this;
        }

        public Criteria andPromotionnLessThanOrEqualTo(Integer value) {
            addCriterion("promotionN <=", value, "promotionn");
            return (Criteria) this;
        }

        public Criteria andPromotionnIn(List<Integer> values) {
            addCriterion("promotionN in", values, "promotionn");
            return (Criteria) this;
        }

        public Criteria andPromotionnNotIn(List<Integer> values) {
            addCriterion("promotionN not in", values, "promotionn");
            return (Criteria) this;
        }

        public Criteria andPromotionnBetween(Integer value1, Integer value2) {
            addCriterion("promotionN between", value1, value2, "promotionn");
            return (Criteria) this;
        }

        public Criteria andPromotionnNotBetween(Integer value1, Integer value2) {
            addCriterion("promotionN not between", value1, value2, "promotionn");
            return (Criteria) this;
        }

        public Criteria andNumberIsNull() {
            addCriterion("number is null");
            return (Criteria) this;
        }

        public Criteria andNumberIsNotNull() {
            addCriterion("number is not null");
            return (Criteria) this;
        }

        public Criteria andNumberEqualTo(Integer value) {
            addCriterion("number =", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberNotEqualTo(Integer value) {
            addCriterion("number <>", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberGreaterThan(Integer value) {
            addCriterion("number >", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberGreaterThanOrEqualTo(Integer value) {
            addCriterion("number >=", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberLessThan(Integer value) {
            addCriterion("number <", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberLessThanOrEqualTo(Integer value) {
            addCriterion("number <=", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberIn(List<Integer> values) {
            addCriterion("number in", values, "number");
            return (Criteria) this;
        }

        public Criteria andNumberNotIn(List<Integer> values) {
            addCriterion("number not in", values, "number");
            return (Criteria) this;
        }

        public Criteria andNumberBetween(Integer value1, Integer value2) {
            addCriterion("number between", value1, value2, "number");
            return (Criteria) this;
        }

        public Criteria andNumberNotBetween(Integer value1, Integer value2) {
            addCriterion("number not between", value1, value2, "number");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andGorderIsNull() {
            addCriterion("gOrder is null");
            return (Criteria) this;
        }

        public Criteria andGorderIsNotNull() {
            addCriterion("gOrder is not null");
            return (Criteria) this;
        }

        public Criteria andGorderEqualTo(Integer value) {
            addCriterion("gOrder =", value, "gorder");
            return (Criteria) this;
        }

        public Criteria andGorderNotEqualTo(Integer value) {
            addCriterion("gOrder <>", value, "gorder");
            return (Criteria) this;
        }

        public Criteria andGorderGreaterThan(Integer value) {
            addCriterion("gOrder >", value, "gorder");
            return (Criteria) this;
        }

        public Criteria andGorderGreaterThanOrEqualTo(Integer value) {
            addCriterion("gOrder >=", value, "gorder");
            return (Criteria) this;
        }

        public Criteria andGorderLessThan(Integer value) {
            addCriterion("gOrder <", value, "gorder");
            return (Criteria) this;
        }

        public Criteria andGorderLessThanOrEqualTo(Integer value) {
            addCriterion("gOrder <=", value, "gorder");
            return (Criteria) this;
        }

        public Criteria andGorderIn(List<Integer> values) {
            addCriterion("gOrder in", values, "gorder");
            return (Criteria) this;
        }

        public Criteria andGorderNotIn(List<Integer> values) {
            addCriterion("gOrder not in", values, "gorder");
            return (Criteria) this;
        }

        public Criteria andGorderBetween(Integer value1, Integer value2) {
            addCriterion("gOrder between", value1, value2, "gorder");
            return (Criteria) this;
        }

        public Criteria andGorderNotBetween(Integer value1, Integer value2) {
            addCriterion("gOrder not between", value1, value2, "gorder");
            return (Criteria) this;
        }

        public Criteria andCreatedIsNull() {
            addCriterion("created is null");
            return (Criteria) this;
        }

        public Criteria andCreatedIsNotNull() {
            addCriterion("created is not null");
            return (Criteria) this;
        }

        public Criteria andCreatedEqualTo(Date value) {
            addCriterion("created =", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedNotEqualTo(Date value) {
            addCriterion("created <>", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedGreaterThan(Date value) {
            addCriterion("created >", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedGreaterThanOrEqualTo(Date value) {
            addCriterion("created >=", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedLessThan(Date value) {
            addCriterion("created <", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedLessThanOrEqualTo(Date value) {
            addCriterion("created <=", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedIn(List<Date> values) {
            addCriterion("created in", values, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedNotIn(List<Date> values) {
            addCriterion("created not in", values, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedBetween(Date value1, Date value2) {
            addCriterion("created between", value1, value2, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedNotBetween(Date value1, Date value2) {
            addCriterion("created not between", value1, value2, "created");
            return (Criteria) this;
        }

        public Criteria andUpdatedIsNull() {
            addCriterion("updated is null");
            return (Criteria) this;
        }

        public Criteria andUpdatedIsNotNull() {
            addCriterion("updated is not null");
            return (Criteria) this;
        }

        public Criteria andUpdatedEqualTo(Date value) {
            addCriterion("updated =", value, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedNotEqualTo(Date value) {
            addCriterion("updated <>", value, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedGreaterThan(Date value) {
            addCriterion("updated >", value, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedGreaterThanOrEqualTo(Date value) {
            addCriterion("updated >=", value, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedLessThan(Date value) {
            addCriterion("updated <", value, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedLessThanOrEqualTo(Date value) {
            addCriterion("updated <=", value, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedIn(List<Date> values) {
            addCriterion("updated in", values, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedNotIn(List<Date> values) {
            addCriterion("updated not in", values, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedBetween(Date value1, Date value2) {
            addCriterion("updated between", value1, value2, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedNotBetween(Date value1, Date value2) {
            addCriterion("updated not between", value1, value2, "updated");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}