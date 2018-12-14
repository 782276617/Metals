package com.metals.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class WjUserExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public WjUserExample() {
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

        public Criteria andUidIsNull() {
            addCriterion("uId is null");
            return (Criteria) this;
        }

        public Criteria andUidIsNotNull() {
            addCriterion("uId is not null");
            return (Criteria) this;
        }

        public Criteria andUidEqualTo(Integer value) {
            addCriterion("uId =", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotEqualTo(Integer value) {
            addCriterion("uId <>", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidGreaterThan(Integer value) {
            addCriterion("uId >", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidGreaterThanOrEqualTo(Integer value) {
            addCriterion("uId >=", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLessThan(Integer value) {
            addCriterion("uId <", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLessThanOrEqualTo(Integer value) {
            addCriterion("uId <=", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidIn(List<Integer> values) {
            addCriterion("uId in", values, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotIn(List<Integer> values) {
            addCriterion("uId not in", values, "uid");
            return (Criteria) this;
        }

        public Criteria andUidBetween(Integer value1, Integer value2) {
            addCriterion("uId between", value1, value2, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotBetween(Integer value1, Integer value2) {
            addCriterion("uId not between", value1, value2, "uid");
            return (Criteria) this;
        }

        public Criteria andUnameIsNull() {
            addCriterion("uName is null");
            return (Criteria) this;
        }

        public Criteria andUnameIsNotNull() {
            addCriterion("uName is not null");
            return (Criteria) this;
        }

        public Criteria andUnameEqualTo(String value) {
            addCriterion("uName =", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameNotEqualTo(String value) {
            addCriterion("uName <>", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameGreaterThan(String value) {
            addCriterion("uName >", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameGreaterThanOrEqualTo(String value) {
            addCriterion("uName >=", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameLessThan(String value) {
            addCriterion("uName <", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameLessThanOrEqualTo(String value) {
            addCriterion("uName <=", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameLike(String value) {
            addCriterion("uName like", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameNotLike(String value) {
            addCriterion("uName not like", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameIn(List<String> values) {
            addCriterion("uName in", values, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameNotIn(List<String> values) {
            addCriterion("uName not in", values, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameBetween(String value1, String value2) {
            addCriterion("uName between", value1, value2, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameNotBetween(String value1, String value2) {
            addCriterion("uName not between", value1, value2, "uname");
            return (Criteria) this;
        }

        public Criteria andUpwdIsNull() {
            addCriterion("uPwd is null");
            return (Criteria) this;
        }

        public Criteria andUpwdIsNotNull() {
            addCriterion("uPwd is not null");
            return (Criteria) this;
        }

        public Criteria andUpwdEqualTo(String value) {
            addCriterion("uPwd =", value, "upwd");
            return (Criteria) this;
        }

        public Criteria andUpwdNotEqualTo(String value) {
            addCriterion("uPwd <>", value, "upwd");
            return (Criteria) this;
        }

        public Criteria andUpwdGreaterThan(String value) {
            addCriterion("uPwd >", value, "upwd");
            return (Criteria) this;
        }

        public Criteria andUpwdGreaterThanOrEqualTo(String value) {
            addCriterion("uPwd >=", value, "upwd");
            return (Criteria) this;
        }

        public Criteria andUpwdLessThan(String value) {
            addCriterion("uPwd <", value, "upwd");
            return (Criteria) this;
        }

        public Criteria andUpwdLessThanOrEqualTo(String value) {
            addCriterion("uPwd <=", value, "upwd");
            return (Criteria) this;
        }

        public Criteria andUpwdLike(String value) {
            addCriterion("uPwd like", value, "upwd");
            return (Criteria) this;
        }

        public Criteria andUpwdNotLike(String value) {
            addCriterion("uPwd not like", value, "upwd");
            return (Criteria) this;
        }

        public Criteria andUpwdIn(List<String> values) {
            addCriterion("uPwd in", values, "upwd");
            return (Criteria) this;
        }

        public Criteria andUpwdNotIn(List<String> values) {
            addCriterion("uPwd not in", values, "upwd");
            return (Criteria) this;
        }

        public Criteria andUpwdBetween(String value1, String value2) {
            addCriterion("uPwd between", value1, value2, "upwd");
            return (Criteria) this;
        }

        public Criteria andUpwdNotBetween(String value1, String value2) {
            addCriterion("uPwd not between", value1, value2, "upwd");
            return (Criteria) this;
        }

        public Criteria andUrealnameIsNull() {
            addCriterion("uRealName is null");
            return (Criteria) this;
        }

        public Criteria andUrealnameIsNotNull() {
            addCriterion("uRealName is not null");
            return (Criteria) this;
        }

        public Criteria andUrealnameEqualTo(String value) {
            addCriterion("uRealName =", value, "urealname");
            return (Criteria) this;
        }

        public Criteria andUrealnameNotEqualTo(String value) {
            addCriterion("uRealName <>", value, "urealname");
            return (Criteria) this;
        }

        public Criteria andUrealnameGreaterThan(String value) {
            addCriterion("uRealName >", value, "urealname");
            return (Criteria) this;
        }

        public Criteria andUrealnameGreaterThanOrEqualTo(String value) {
            addCriterion("uRealName >=", value, "urealname");
            return (Criteria) this;
        }

        public Criteria andUrealnameLessThan(String value) {
            addCriterion("uRealName <", value, "urealname");
            return (Criteria) this;
        }

        public Criteria andUrealnameLessThanOrEqualTo(String value) {
            addCriterion("uRealName <=", value, "urealname");
            return (Criteria) this;
        }

        public Criteria andUrealnameLike(String value) {
            addCriterion("uRealName like", value, "urealname");
            return (Criteria) this;
        }

        public Criteria andUrealnameNotLike(String value) {
            addCriterion("uRealName not like", value, "urealname");
            return (Criteria) this;
        }

        public Criteria andUrealnameIn(List<String> values) {
            addCriterion("uRealName in", values, "urealname");
            return (Criteria) this;
        }

        public Criteria andUrealnameNotIn(List<String> values) {
            addCriterion("uRealName not in", values, "urealname");
            return (Criteria) this;
        }

        public Criteria andUrealnameBetween(String value1, String value2) {
            addCriterion("uRealName between", value1, value2, "urealname");
            return (Criteria) this;
        }

        public Criteria andUrealnameNotBetween(String value1, String value2) {
            addCriterion("uRealName not between", value1, value2, "urealname");
            return (Criteria) this;
        }

        public Criteria andUsexIsNull() {
            addCriterion("uSex is null");
            return (Criteria) this;
        }

        public Criteria andUsexIsNotNull() {
            addCriterion("uSex is not null");
            return (Criteria) this;
        }

        public Criteria andUsexEqualTo(String value) {
            addCriterion("uSex =", value, "usex");
            return (Criteria) this;
        }

        public Criteria andUsexNotEqualTo(String value) {
            addCriterion("uSex <>", value, "usex");
            return (Criteria) this;
        }

        public Criteria andUsexGreaterThan(String value) {
            addCriterion("uSex >", value, "usex");
            return (Criteria) this;
        }

        public Criteria andUsexGreaterThanOrEqualTo(String value) {
            addCriterion("uSex >=", value, "usex");
            return (Criteria) this;
        }

        public Criteria andUsexLessThan(String value) {
            addCriterion("uSex <", value, "usex");
            return (Criteria) this;
        }

        public Criteria andUsexLessThanOrEqualTo(String value) {
            addCriterion("uSex <=", value, "usex");
            return (Criteria) this;
        }

        public Criteria andUsexLike(String value) {
            addCriterion("uSex like", value, "usex");
            return (Criteria) this;
        }

        public Criteria andUsexNotLike(String value) {
            addCriterion("uSex not like", value, "usex");
            return (Criteria) this;
        }

        public Criteria andUsexIn(List<String> values) {
            addCriterion("uSex in", values, "usex");
            return (Criteria) this;
        }

        public Criteria andUsexNotIn(List<String> values) {
            addCriterion("uSex not in", values, "usex");
            return (Criteria) this;
        }

        public Criteria andUsexBetween(String value1, String value2) {
            addCriterion("uSex between", value1, value2, "usex");
            return (Criteria) this;
        }

        public Criteria andUsexNotBetween(String value1, String value2) {
            addCriterion("uSex not between", value1, value2, "usex");
            return (Criteria) this;
        }

        public Criteria andUphoneIsNull() {
            addCriterion("uPhone is null");
            return (Criteria) this;
        }

        public Criteria andUphoneIsNotNull() {
            addCriterion("uPhone is not null");
            return (Criteria) this;
        }

        public Criteria andUphoneEqualTo(String value) {
            addCriterion("uPhone =", value, "uphone");
            return (Criteria) this;
        }

        public Criteria andUphoneNotEqualTo(String value) {
            addCriterion("uPhone <>", value, "uphone");
            return (Criteria) this;
        }

        public Criteria andUphoneGreaterThan(String value) {
            addCriterion("uPhone >", value, "uphone");
            return (Criteria) this;
        }

        public Criteria andUphoneGreaterThanOrEqualTo(String value) {
            addCriterion("uPhone >=", value, "uphone");
            return (Criteria) this;
        }

        public Criteria andUphoneLessThan(String value) {
            addCriterion("uPhone <", value, "uphone");
            return (Criteria) this;
        }

        public Criteria andUphoneLessThanOrEqualTo(String value) {
            addCriterion("uPhone <=", value, "uphone");
            return (Criteria) this;
        }

        public Criteria andUphoneLike(String value) {
            addCriterion("uPhone like", value, "uphone");
            return (Criteria) this;
        }

        public Criteria andUphoneNotLike(String value) {
            addCriterion("uPhone not like", value, "uphone");
            return (Criteria) this;
        }

        public Criteria andUphoneIn(List<String> values) {
            addCriterion("uPhone in", values, "uphone");
            return (Criteria) this;
        }

        public Criteria andUphoneNotIn(List<String> values) {
            addCriterion("uPhone not in", values, "uphone");
            return (Criteria) this;
        }

        public Criteria andUphoneBetween(String value1, String value2) {
            addCriterion("uPhone between", value1, value2, "uphone");
            return (Criteria) this;
        }

        public Criteria andUphoneNotBetween(String value1, String value2) {
            addCriterion("uPhone not between", value1, value2, "uphone");
            return (Criteria) this;
        }

        public Criteria andUtypeIsNull() {
            addCriterion("utype is null");
            return (Criteria) this;
        }

        public Criteria andUtypeIsNotNull() {
            addCriterion("utype is not null");
            return (Criteria) this;
        }

        public Criteria andUtypeEqualTo(Long value) {
            addCriterion("utype =", value, "utype");
            return (Criteria) this;
        }

        public Criteria andUtypeNotEqualTo(Long value) {
            addCriterion("utype <>", value, "utype");
            return (Criteria) this;
        }

        public Criteria andUtypeGreaterThan(Long value) {
            addCriterion("utype >", value, "utype");
            return (Criteria) this;
        }

        public Criteria andUtypeGreaterThanOrEqualTo(Long value) {
            addCriterion("utype >=", value, "utype");
            return (Criteria) this;
        }

        public Criteria andUtypeLessThan(Long value) {
            addCriterion("utype <", value, "utype");
            return (Criteria) this;
        }

        public Criteria andUtypeLessThanOrEqualTo(Long value) {
            addCriterion("utype <=", value, "utype");
            return (Criteria) this;
        }

        public Criteria andUtypeIn(List<Long> values) {
            addCriterion("utype in", values, "utype");
            return (Criteria) this;
        }

        public Criteria andUtypeNotIn(List<Long> values) {
            addCriterion("utype not in", values, "utype");
            return (Criteria) this;
        }

        public Criteria andUtypeBetween(Long value1, Long value2) {
            addCriterion("utype between", value1, value2, "utype");
            return (Criteria) this;
        }

        public Criteria andUtypeNotBetween(Long value1, Long value2) {
            addCriterion("utype not between", value1, value2, "utype");
            return (Criteria) this;
        }

        public Criteria andUweixinIsNull() {
            addCriterion("uweixin is null");
            return (Criteria) this;
        }

        public Criteria andUweixinIsNotNull() {
            addCriterion("uweixin is not null");
            return (Criteria) this;
        }

        public Criteria andUweixinEqualTo(String value) {
            addCriterion("uweixin =", value, "uweixin");
            return (Criteria) this;
        }

        public Criteria andUweixinNotEqualTo(String value) {
            addCriterion("uweixin <>", value, "uweixin");
            return (Criteria) this;
        }

        public Criteria andUweixinGreaterThan(String value) {
            addCriterion("uweixin >", value, "uweixin");
            return (Criteria) this;
        }

        public Criteria andUweixinGreaterThanOrEqualTo(String value) {
            addCriterion("uweixin >=", value, "uweixin");
            return (Criteria) this;
        }

        public Criteria andUweixinLessThan(String value) {
            addCriterion("uweixin <", value, "uweixin");
            return (Criteria) this;
        }

        public Criteria andUweixinLessThanOrEqualTo(String value) {
            addCriterion("uweixin <=", value, "uweixin");
            return (Criteria) this;
        }

        public Criteria andUweixinLike(String value) {
            addCriterion("uweixin like", value, "uweixin");
            return (Criteria) this;
        }

        public Criteria andUweixinNotLike(String value) {
            addCriterion("uweixin not like", value, "uweixin");
            return (Criteria) this;
        }

        public Criteria andUweixinIn(List<String> values) {
            addCriterion("uweixin in", values, "uweixin");
            return (Criteria) this;
        }

        public Criteria andUweixinNotIn(List<String> values) {
            addCriterion("uweixin not in", values, "uweixin");
            return (Criteria) this;
        }

        public Criteria andUweixinBetween(String value1, String value2) {
            addCriterion("uweixin between", value1, value2, "uweixin");
            return (Criteria) this;
        }

        public Criteria andUweixinNotBetween(String value1, String value2) {
            addCriterion("uweixin not between", value1, value2, "uweixin");
            return (Criteria) this;
        }

        public Criteria andUpicIsNull() {
            addCriterion("uPic is null");
            return (Criteria) this;
        }

        public Criteria andUpicIsNotNull() {
            addCriterion("uPic is not null");
            return (Criteria) this;
        }

        public Criteria andUpicEqualTo(String value) {
            addCriterion("uPic =", value, "upic");
            return (Criteria) this;
        }

        public Criteria andUpicNotEqualTo(String value) {
            addCriterion("uPic <>", value, "upic");
            return (Criteria) this;
        }

        public Criteria andUpicGreaterThan(String value) {
            addCriterion("uPic >", value, "upic");
            return (Criteria) this;
        }

        public Criteria andUpicGreaterThanOrEqualTo(String value) {
            addCriterion("uPic >=", value, "upic");
            return (Criteria) this;
        }

        public Criteria andUpicLessThan(String value) {
            addCriterion("uPic <", value, "upic");
            return (Criteria) this;
        }

        public Criteria andUpicLessThanOrEqualTo(String value) {
            addCriterion("uPic <=", value, "upic");
            return (Criteria) this;
        }

        public Criteria andUpicLike(String value) {
            addCriterion("uPic like", value, "upic");
            return (Criteria) this;
        }

        public Criteria andUpicNotLike(String value) {
            addCriterion("uPic not like", value, "upic");
            return (Criteria) this;
        }

        public Criteria andUpicIn(List<String> values) {
            addCriterion("uPic in", values, "upic");
            return (Criteria) this;
        }

        public Criteria andUpicNotIn(List<String> values) {
            addCriterion("uPic not in", values, "upic");
            return (Criteria) this;
        }

        public Criteria andUpicBetween(String value1, String value2) {
            addCriterion("uPic between", value1, value2, "upic");
            return (Criteria) this;
        }

        public Criteria andUpicNotBetween(String value1, String value2) {
            addCriterion("uPic not between", value1, value2, "upic");
            return (Criteria) this;
        }

        public Criteria andUcompanyIsNull() {
            addCriterion("ucompany is null");
            return (Criteria) this;
        }

        public Criteria andUcompanyIsNotNull() {
            addCriterion("ucompany is not null");
            return (Criteria) this;
        }

        public Criteria andUcompanyEqualTo(String value) {
            addCriterion("ucompany =", value, "ucompany");
            return (Criteria) this;
        }

        public Criteria andUcompanyNotEqualTo(String value) {
            addCriterion("ucompany <>", value, "ucompany");
            return (Criteria) this;
        }

        public Criteria andUcompanyGreaterThan(String value) {
            addCriterion("ucompany >", value, "ucompany");
            return (Criteria) this;
        }

        public Criteria andUcompanyGreaterThanOrEqualTo(String value) {
            addCriterion("ucompany >=", value, "ucompany");
            return (Criteria) this;
        }

        public Criteria andUcompanyLessThan(String value) {
            addCriterion("ucompany <", value, "ucompany");
            return (Criteria) this;
        }

        public Criteria andUcompanyLessThanOrEqualTo(String value) {
            addCriterion("ucompany <=", value, "ucompany");
            return (Criteria) this;
        }

        public Criteria andUcompanyLike(String value) {
            addCriterion("ucompany like", value, "ucompany");
            return (Criteria) this;
        }

        public Criteria andUcompanyNotLike(String value) {
            addCriterion("ucompany not like", value, "ucompany");
            return (Criteria) this;
        }

        public Criteria andUcompanyIn(List<String> values) {
            addCriterion("ucompany in", values, "ucompany");
            return (Criteria) this;
        }

        public Criteria andUcompanyNotIn(List<String> values) {
            addCriterion("ucompany not in", values, "ucompany");
            return (Criteria) this;
        }

        public Criteria andUcompanyBetween(String value1, String value2) {
            addCriterion("ucompany between", value1, value2, "ucompany");
            return (Criteria) this;
        }

        public Criteria andUcompanyNotBetween(String value1, String value2) {
            addCriterion("ucompany not between", value1, value2, "ucompany");
            return (Criteria) this;
        }

        public Criteria andUregistetimeIsNull() {
            addCriterion("uRegistetime is null");
            return (Criteria) this;
        }

        public Criteria andUregistetimeIsNotNull() {
            addCriterion("uRegistetime is not null");
            return (Criteria) this;
        }

        public Criteria andUregistetimeEqualTo(Date value) {
            addCriterion("uRegistetime =", value, "uregistetime");
            return (Criteria) this;
        }

        public Criteria andUregistetimeNotEqualTo(Date value) {
            addCriterion("uRegistetime <>", value, "uregistetime");
            return (Criteria) this;
        }

        public Criteria andUregistetimeGreaterThan(Date value) {
            addCriterion("uRegistetime >", value, "uregistetime");
            return (Criteria) this;
        }

        public Criteria andUregistetimeGreaterThanOrEqualTo(Date value) {
            addCriterion("uRegistetime >=", value, "uregistetime");
            return (Criteria) this;
        }

        public Criteria andUregistetimeLessThan(Date value) {
            addCriterion("uRegistetime <", value, "uregistetime");
            return (Criteria) this;
        }

        public Criteria andUregistetimeLessThanOrEqualTo(Date value) {
            addCriterion("uRegistetime <=", value, "uregistetime");
            return (Criteria) this;
        }

        public Criteria andUregistetimeIn(List<Date> values) {
            addCriterion("uRegistetime in", values, "uregistetime");
            return (Criteria) this;
        }

        public Criteria andUregistetimeNotIn(List<Date> values) {
            addCriterion("uRegistetime not in", values, "uregistetime");
            return (Criteria) this;
        }

        public Criteria andUregistetimeBetween(Date value1, Date value2) {
            addCriterion("uRegistetime between", value1, value2, "uregistetime");
            return (Criteria) this;
        }

        public Criteria andUregistetimeNotBetween(Date value1, Date value2) {
            addCriterion("uRegistetime not between", value1, value2, "uregistetime");
            return (Criteria) this;
        }

        public Criteria andUlastdateIsNull() {
            addCriterion("uLastdate is null");
            return (Criteria) this;
        }

        public Criteria andUlastdateIsNotNull() {
            addCriterion("uLastdate is not null");
            return (Criteria) this;
        }

        public Criteria andUlastdateEqualTo(Date value) {
            addCriterion("uLastdate =", value, "ulastdate");
            return (Criteria) this;
        }

        public Criteria andUlastdateNotEqualTo(Date value) {
            addCriterion("uLastdate <>", value, "ulastdate");
            return (Criteria) this;
        }

        public Criteria andUlastdateGreaterThan(Date value) {
            addCriterion("uLastdate >", value, "ulastdate");
            return (Criteria) this;
        }

        public Criteria andUlastdateGreaterThanOrEqualTo(Date value) {
            addCriterion("uLastdate >=", value, "ulastdate");
            return (Criteria) this;
        }

        public Criteria andUlastdateLessThan(Date value) {
            addCriterion("uLastdate <", value, "ulastdate");
            return (Criteria) this;
        }

        public Criteria andUlastdateLessThanOrEqualTo(Date value) {
            addCriterion("uLastdate <=", value, "ulastdate");
            return (Criteria) this;
        }

        public Criteria andUlastdateIn(List<Date> values) {
            addCriterion("uLastdate in", values, "ulastdate");
            return (Criteria) this;
        }

        public Criteria andUlastdateNotIn(List<Date> values) {
            addCriterion("uLastdate not in", values, "ulastdate");
            return (Criteria) this;
        }

        public Criteria andUlastdateBetween(Date value1, Date value2) {
            addCriterion("uLastdate between", value1, value2, "ulastdate");
            return (Criteria) this;
        }

        public Criteria andUlastdateNotBetween(Date value1, Date value2) {
            addCriterion("uLastdate not between", value1, value2, "ulastdate");
            return (Criteria) this;
        }

        public Criteria andUlastloginipIsNull() {
            addCriterion("uLastloginIP is null");
            return (Criteria) this;
        }

        public Criteria andUlastloginipIsNotNull() {
            addCriterion("uLastloginIP is not null");
            return (Criteria) this;
        }

        public Criteria andUlastloginipEqualTo(String value) {
            addCriterion("uLastloginIP =", value, "ulastloginip");
            return (Criteria) this;
        }

        public Criteria andUlastloginipNotEqualTo(String value) {
            addCriterion("uLastloginIP <>", value, "ulastloginip");
            return (Criteria) this;
        }

        public Criteria andUlastloginipGreaterThan(String value) {
            addCriterion("uLastloginIP >", value, "ulastloginip");
            return (Criteria) this;
        }

        public Criteria andUlastloginipGreaterThanOrEqualTo(String value) {
            addCriterion("uLastloginIP >=", value, "ulastloginip");
            return (Criteria) this;
        }

        public Criteria andUlastloginipLessThan(String value) {
            addCriterion("uLastloginIP <", value, "ulastloginip");
            return (Criteria) this;
        }

        public Criteria andUlastloginipLessThanOrEqualTo(String value) {
            addCriterion("uLastloginIP <=", value, "ulastloginip");
            return (Criteria) this;
        }

        public Criteria andUlastloginipLike(String value) {
            addCriterion("uLastloginIP like", value, "ulastloginip");
            return (Criteria) this;
        }

        public Criteria andUlastloginipNotLike(String value) {
            addCriterion("uLastloginIP not like", value, "ulastloginip");
            return (Criteria) this;
        }

        public Criteria andUlastloginipIn(List<String> values) {
            addCriterion("uLastloginIP in", values, "ulastloginip");
            return (Criteria) this;
        }

        public Criteria andUlastloginipNotIn(List<String> values) {
            addCriterion("uLastloginIP not in", values, "ulastloginip");
            return (Criteria) this;
        }

        public Criteria andUlastloginipBetween(String value1, String value2) {
            addCriterion("uLastloginIP between", value1, value2, "ulastloginip");
            return (Criteria) this;
        }

        public Criteria andUlastloginipNotBetween(String value1, String value2) {
            addCriterion("uLastloginIP not between", value1, value2, "ulastloginip");
            return (Criteria) this;
        }

        public Criteria andUlogincountIsNull() {
            addCriterion("uLoginCount is null");
            return (Criteria) this;
        }

        public Criteria andUlogincountIsNotNull() {
            addCriterion("uLoginCount is not null");
            return (Criteria) this;
        }

        public Criteria andUlogincountEqualTo(Integer value) {
            addCriterion("uLoginCount =", value, "ulogincount");
            return (Criteria) this;
        }

        public Criteria andUlogincountNotEqualTo(Integer value) {
            addCriterion("uLoginCount <>", value, "ulogincount");
            return (Criteria) this;
        }

        public Criteria andUlogincountGreaterThan(Integer value) {
            addCriterion("uLoginCount >", value, "ulogincount");
            return (Criteria) this;
        }

        public Criteria andUlogincountGreaterThanOrEqualTo(Integer value) {
            addCriterion("uLoginCount >=", value, "ulogincount");
            return (Criteria) this;
        }

        public Criteria andUlogincountLessThan(Integer value) {
            addCriterion("uLoginCount <", value, "ulogincount");
            return (Criteria) this;
        }

        public Criteria andUlogincountLessThanOrEqualTo(Integer value) {
            addCriterion("uLoginCount <=", value, "ulogincount");
            return (Criteria) this;
        }

        public Criteria andUlogincountIn(List<Integer> values) {
            addCriterion("uLoginCount in", values, "ulogincount");
            return (Criteria) this;
        }

        public Criteria andUlogincountNotIn(List<Integer> values) {
            addCriterion("uLoginCount not in", values, "ulogincount");
            return (Criteria) this;
        }

        public Criteria andUlogincountBetween(Integer value1, Integer value2) {
            addCriterion("uLoginCount between", value1, value2, "ulogincount");
            return (Criteria) this;
        }

        public Criteria andUlogincountNotBetween(Integer value1, Integer value2) {
            addCriterion("uLoginCount not between", value1, value2, "ulogincount");
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