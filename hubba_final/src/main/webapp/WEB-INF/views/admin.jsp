<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.hubba.vo.MenuVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
  <meta charset="UTF-8" >
	<link rel="shortcut icon" href="resources/img/real_favi.ico">
  <title>admin page</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/jvectormap/2.0.4/jquery-jvectormap.min.css'>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto+Condensed);
* {
  box-sizing: border-box;
}

body {
  background: #f0f0f0;
  line-height: normal;
  font-size: 16px;
  overflow-Y: scroll;
  -webkit-font-smoothing: antialiased !important;
}

a, a:hover, a:visited, a:link, a:active {
  text-decoration: none;
}

a:active {
  color: #fff !important;
}

.sm-img {
  height: 30px !important;
  width: 30px !important;
}

::-moz-selection {
  background: #5af;
  color: #fff;
  text-shadow: none;
}

::selection {
  background: #5af;
  color: #fff;
  text-shadow: none;
}

.rad-page-title {
  margin-bottom: 20px;
  text-shadow: 1px 4px 6px #c6c6c6, 0 0 0 #000, 1px 4px 6px #c6c6c6;
}
.rad-page-title span {
  font-size: 22px;
  font-weight: 500;
  display: block;
}

.rad-navigation {
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
  box-shadow: 0 0px 9px 4px rgba(0, 0, 0, 0.1), 0 -5px 2px 2px rgba(0, 0, 0, 0.1);
  background: white;
  z-index: 10000;
  text-align: center;
}
.rad-navigation ul {
  margin-bottom: 0;
}

.rad-logo-hidden {
  line-height: 75px;
  font-weight: 900;
  text-transform: uppercase;
  font-size: 22px;
  text-decoration: none;
  color: #222533;
  opacity: 0;
  visibility: hidden;
  position: absolute;
  left: 50%;
  -webkit-transition: all .2s ease-in-out;
  transition: all .2s ease-in-out;
}

.links {
  margin-right: 10px;
  position: relative;
}
.links > li {
  list-style: none;
  position: relative;
  margin: 10px;
  display: inline-block;
}

.rad-dropmenu-item.active {
  display: block;
  -webkit-animation: flipInX 1s ease;
}

.lg-text {
  font-size: 13px;
  font-weight: 600;
  color: #333;
}

.sm-text {
  font-size: 11px;
  color: #c6c6c6;
}

.md-text {
  font-size: 12px;
  color: #c6c6c6;
}

.rad-notification-item {
  width: 100%;
  padding: 15px;
  border-bottom: 1px solid #EEEEEE;
}
.rad-notification-item:hover {
  background: #F5F5F5;
}
.rad-notification-item .rad-notification-content {
  color: #404040;
}

.rad-notification-body {
  color: black;
  vertical-align: middle;
  margin-left: 30px;
}

.rad-logo-container {
  width: 225px;
  text-align: center;
  height: 50px;
  float: left;
  -webkit-transition: all .2s ease-in-out;
  transition: all .2s ease-in-out;
}

.rad-top-nav-container {
  float: right;
  -webkit-transition: all .2s ease-in-out;
  transition: all .2s ease-in-out;
}

.rad-toggle-btn,
.rad-logo {
  text-decoration: none;
  position: relative;
  height: 50px;
  line-height: 50px;
  padding: 0 15px;
  font-size: 22px;
  font-weight: 900;
  text-transform: uppercase;
  text-decoration: none;
  color: #222533;
  display: inline-block;
}

.rad-logo i {
  padding-top: 2px;
  vertical-align: middle;
  margin-right: 10px;
}

.rad-toggle-btn:hover {
  background: #f9f9f9;
}

.rad-menu-item {
  position: relative;
  padding: 0 5px;
  line-height: 30px;
  height: 30px;
  color: #89949B;
  z-index: 5;
  display: inline-block;
}

.rad-badge {
  height: 20px;
  color: white;
  border-radius: 10px;
  line-height: 20px;
  font-size: 12px;
  background: #E94B3B;
  box-shadow: 0.5px 0.2px 1px rgba(0, 0, 0, 0.5);
  display: inline-block;
  text-align: center;
}

.rad-menu-badge {
  position: absolute;
  min-width: 20px;
  min-height: 20px;
  line-height: 20px;
  font-weight: bold;
  color: white;
  border-radius: 100%;
  font-size: 12px;
  background: #E94B3B;
  box-shadow: 0.5px 0.2px 1px rgba(0, 0, 0, 0.5);
  display: inline-block;
  text-align: center;
  top: -10px;
  z-index: 1;
}

.sm-menu {
  min-width: 150px !important;
}
.sm-menu > li {
  padding: 10px;
  text-align: left;
}
.sm-menu > li i {
  margin: 0 10px 0 0;
}
.sm-menu > li > a {
  padding: 10px;
}

.rad-dropmenu-item {
  position: absolute;
  right: -6px;
  top: 45px;
  min-width: 250px;
  background: white;
  border: 1px solid #BDBDBD;
  border-top: 5px solid #515d6e;
  border-radius: 2px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
  display: none;
}
.rad-dropmenu-item:before {
  content: "";
  position: absolute;
  border-width: 0 10px 10px 10px;
  border-style: solid;
  border-color: #515d6e transparent;
  top: -14px;
  right: 8px;
}

.rad-dropmenu-item.rad-settings {
  right: 0 !important;
  left: auto !important;
}
.rad-dropmenu-item.rad-settings:before {
  right: 5px !important;
  left: auto !important;
}
.rad-dropmenu-item.rad-settings > .rad-notification-item:hover {
  background: #fff !important;
}
.rad-dropmenu-item.rad-settings > .rad-notification-item i {
  font-size: 24px;
}

.rad-dropmenu-footer,
.rad-dropmenu-header {
  display: block !important;
  background: #CFD8DC;
  text-transform: uppercase;
  font-size: 12px;
  margin: 0 !important;
  padding: 6px;
  text-align: center;
}
.rad-dropmenu-footer > a,
.rad-dropmenu-header > a {
  color: white;
  line-height: 12px;
  text-decoration: none;
}

.rad-dropmenu-header {
  border-bottom: 1px solid #CFD8DC;
}

.rad-dropmenu-footer {
  border-top: 1px solid #CFD8DC;
}

.rad-chk-pin {
  margin: 0 !important;
}
.rad-chk-pin span {
  display: inline-block;
  position: relative;
  height: 20px;
  width: 40px;
  border-radius: 4px;
  background: crimson;
  border: 1px solid #f6f6f6;
}
.rad-chk-pin span:after {
  content: "";
  position: absolute;
  background: white;
  width: 20px;
  height: 20px;
  border-radius: 4px;
  top: -1px;
  left: 0px;
  box-shadow: 0 0 0.5px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  -webkit-transition: all .2s ease;
  transition: all .2s ease;
}
.rad-chk-pin input {
  display: none;
}
.rad-chk-pin input:checked + span {
  background: #23AE89;
}
.rad-chk-pin input:checked + span:after {
  left: 19px;
}

.hide {
  display: none;
}

.rad-option-selected {
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2), 0 -2px 4px rgba(0, 0, 0, 0.2);
  -webkit-transform: scale(1.1);
          transform: scale(1.1);
  -webkit-transition: all .2s linear;
  transition: all .2s linear;
}

.rad-color-swatch {
  display: table;
  width: 90px;
  height: 25px;
  border-radius: 4px;
}
.rad-color-swatch .colors {
  width: 25px;
  height: 25px;
  display: table-cell;
  cursor: pointer;
}
.rad-color-swatch .colors input[type="radio"] {
  display: none;
}
.rad-color-swatch .colors:first-child {
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}
.rad-color-swatch .colors:last-child {
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
}

.rad-sidebar {
  z-index: 9999;
  position: fixed;
  font-weight: 600;
  background: white !important;
  width: 225px;
  height: 100vh;
  top: 50px;
  left: 0;
  bottom: 0;
  box-shadow: 0 0 4px rgba(0, 0, 0, 0.14), 2px 4px 8px rgba(0, 0, 0, 0.28);
  -webkit-transition: all .2s ease-in-out;
  transition: all .2s ease-in-out;
}
.rad-sidebar li {
  text-align: left;
  height: 45px;
  font-size: 14px;
  font-weight: 500;
  letter-spacing: .025em;
  line-height: 1.5;
}
.rad-sidebar li a {
  text-decoration: none;
  display: block;
  color: #515d6e;
}
.rad-sidebar li a i {
  position: relative;
  width: 45px;
  line-height: 45px;
  text-align: center;
}
.rad-sidebar li a i:before {
  z-index: 10;
  position: relative;
}
.rad-sidebar li a > span {
  display: inline-block;
  visibility: visible;
  opacity: 1;
  padding-left: 10px;
  -webkit-transition: all .2s ease-in-out .2s;
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
  text-transform: uppercase;
  font-size: 11px;
}
.rad-sidebar li:hover {
  background: #f2f2f2;
}
.rad-sidebar li:hover .icon-bg {
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
}
.rad-sidebar li:hover a > i {
  color: white;
}

.icon-bg {
  position: absolute;
  left: 0;
  top: 0;
  bottom: 0;
  z-index: 1;
  width: 100%;
  -webkit-transform: translate3d(-43px, 0, 0);
          transform: translate3d(-43px, 0, 0);
  -webkit-transition: all .2s ease-in-out;
  transition: all .2s ease-in-out;
}

.rad-txt-primary {
  color: #1C7EBB;
}

.rad-bg-primary {
  background: #1C7EBB;
}

.rad-txt-success {
  color: #23AE89;
}

.rad-bg-success {
  background: #23AE89;
}

.rad-txt-danger {
  color: #E94B3B;
}

.rad-bg-danger {
  background: #E94B3B;
}

.rad-txt-warning {
  color: #F98E33;
}

.rad-bg-warning {
  background: #F98E33;
}

.rad-txt-violet {
  color: #6A55C2;
}

.rad-bg-violet {
  background: #6A55C2;
}

.rad-logo-container.rad-nav-min {
  -webkit-transform: translate3d(-180px, 0, 0);
          transform: translate3d(-180px, 0, 0);
}
.rad-logo-container.rad-nav-min .rad-logo {
  opacity: 0;
}
.rad-logo-container.rad-nav-min + .rad-logo-hidden {
  opacity: 1;
  visibility: visible;
}

.rad-sidebar.rad-nav-min {
  width: 45px !important;
}
.rad-sidebar.rad-nav-min .rad-sidebar-item {
  opacity: 0;
  visibility: hidden;
  -webkit-transition: all .1s linear;
  -webkit-transform: translate3d(-200px, 0, 0);
          transform: translate3d(-200px, 0, 0);
}
.rad-sidebar.rad-nav-min .icon-bg {
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
}
.rad-sidebar.rad-nav-min i {
  border: 0px;
  color: white;
  -webkit-transition: all .2s linear;
  transition: all .2s linear;
}
.rad-sidebar.rad-nav-min li:hover .icon-bg {
  -webkit-transform: scale(1.2, 1);
          transform: scale(1.2, 1);
}

.rad-body-wrapper {
  position: absolute;
  left: 230px;
  top: 75px;
  width: auto;
  right: 0;
  -webkit-transition: all .2s ease-in-out;
  transition: all .2s ease-in-out;
}

.rad-body-wrapper.rad-nav-min {
  left: 50px;
}

.rad-chart {
  height: 250px;
}

.rad-map {
  width: 100%;
  height: 100%;
}

.rad-map-container {
  height: 400px;
  position: relative;
}

.rad-collapse {
  height: 0px;
  padding: 0;
  opacity: 0;
  overflow: hidden;
}

@-webkit-keyframes rotating {
  from {
    -webkit-transform: rotate(0deg);
  }
  to {
    -webkit-transform: rotate(360deg);
  }
}
@-webkit-keyframes flipInX {
  0% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, 90deg);
    -webkit-transition-timing-function: ease-in;
    opacity: 0;
  }
  40% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, -20deg);
    -webkit-transition-timing-function: ease-in;
  }
  60% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, 10deg);
    opacity: 1;
  }
  80% {
    -webkit-transform: perspective(400px) rotate3d(1, 0, 0, -5deg);
  }
  100% {
    -webkit-transform: perspective(400px);
  }
}
@media screen and (max-width: 450px) {
  .rad-info-box i {
    opacity: .3;
  }

  .flat-theme .rad-toggle-btn {
    right: 20px !important;
  }
  .flat-theme .rad-top-nav-container .links:last-child {
    display: none;
  }
}
@media screen and (min-width: 850px) {
  .rad-logo-container {
    height: 75px;
  }
  .rad-logo-container .rad-logo {
    line-height: 75px;
  }
  .rad-logo-container .rad-toggle-btn {
    line-height: 75px;
    height: auto;
  }

  .rad-top-nav-container {
    padding: 10px;
  }

  .rad-sidebar {
    top: 75px;
  }

  .rad-body-wrapper {
    top: 100px;
  }

  .flat-theme .rad-toggle-btn {
    top: 20px !important;
  }
}
@media screen and (max-width: 850px) {
  .flat-theme .rad-menu-badge {
    top: -3px;
  }
  .flat-theme .rad-toggle-btn {
    right: 20px !important;
  }
  .flat-theme .rad-body-wrapper {
    top: 125px !important;
  }
  .flat-theme .rad-sidebar {
    position: absolute;
  }
  .flat-theme .rad-navigation {
    position: absolute;
  }
  .flat-theme .rad-navigation .links > li:first-child {
    margin-left: 15px !important;
  }
  .flat-theme.sticky .rad-logo-container {
    z-index: 10000;
  }
  .flat-theme.sticky .rad-logo-container .rad-toggle-btn {
    color: #89949B !important;
    position: fixed;
    right: 120px !important;
    background: #f6f6f6;
    top: 11px;
  }
  .flat-theme.sticky .rad-logo-container .rad-toggle-btn:hover {
    background: crimson;
    color: #fff !important;
  }
  .flat-theme.sticky .rad-navigation {
    height: 50px;
  }
  .flat-theme.sticky .rad-sidebar {
    top: 50px;
    position: fixed;
  }
  .flat-theme.sticky .rad-top-nav-container {
    background: #FFF important;
    box-shadow: 0 0px 9px 4px rgba(0, 0, 0, 0.1), 0 -5px 2px 2px rgba(0, 0, 0, 0.1);
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    z-index: 1000;
  }
  .flat-theme.sticky .links {
    margin-left: 50px;
  }
  .flat-theme.sticky .brand-icon {
    margin-left: 0px;
  }
  .flat-theme.sticky .brand-icon:hover {
    color: #fff;
  }

  .rad-navigation {
    height: 100px;
  }

  .rad-logo-container.rad-nav-min {
    -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
    background: transparent;
  }
  .rad-logo-container.rad-nav-min .rad-logo {
    opacity: 1;
  }
  .rad-logo-container.rad-nav-min + .rad-logo-hidden {
    display: none;
  }

  .rad-logo-container {
    display: block;
    float: none;
    width: 100%;
    border-bottom: 1px solid #F2F2F2;
  }

  .rad-top-nav-container {
    display: block;
    float: none;
    height: 50px;
    background: white;
  }
  .rad-top-nav-container .links > li > a {
    font-size: 12px;
  }

  .rad-menu-badge {
    font-size: 10px;
    min-width: 15px;
    min-height: 15px;
    line-height: 15px;
  }

  .rad-sidebar {
    top: 100px;
  }

  .rad-sidebar.rad-nav-min {
    -webkit-transform: translate3d(-200px, 0, 0);
            transform: translate3d(-200px, 0, 0);
  }

  .rad-body-wrapper {
    top: 125px;
    position: relative;
  }

  .rad-body-wrapper.rad-nav-min {
    left: 0px;
  }
}
.panel {
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26);
  border-radius: 0 !important;
  position: relative;
  -webkit-transition: all .2s linear;
}

.panel-close {
  -webkit-transform: scale3d(0, 0, 0);
          transform: scale3d(0, 0, 0);
}

.panel-body {
  position: relative;
  -webkit-transition: all .2s linear;
}

.panel-heading {
  background: white !important;
  border-radius: 0;
  padding: 15px;
  border-bottom: 0 !important;
}

.panel-heading .panel-title {
  text-transform: uppercase;
  font-weight: 600;
  font-size: 13px;
  color: #515d6e;
}

.overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 1001;
  background: rgba(255, 255, 255, 0.75);
  text-align: center;
}
.overlay:before {
  content: "";
  height: 100%;
  vertical-align: middle;
  width: 1px;
  display: inline-block;
  margin-left: -5px;
}
.overlay .overlay-content {
  display: inline-block;
  vertical-align: middle;
}
.overlay i {
  display: block;
  position: inline-block;
  vertical-align: middle;
  color: black;
}

.rad-panel-action {
  list-style: none;
  display: inline-block;
  float: right;
}

.rad-panel-action li {
  display: inline-block;
  color: #515d6e;
  margin: 0 5px;
  cursor: pointer;
}

.rad-info-box {
  margin-bottom: 16px;
  box-shadow: 1px 1px 2px 0 #CCCCCC;
  padding: 20px;
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26);
  background: white !important;
}

.rad-info-box i {
  display: block;
  background-clip: padding-box;
  margin-right: 15px;
  height: 60px;
  width: 60px;
  border-radius: 100%;
  line-height: 60px;
  text-align: center;
  font-size: 4.4em;
  position: absolute;
}

.rad-info-box .value,
.rad-info-box .heading {
  display: block;
  position: relative;
  color: #515d6e;
  text-align: right;
  z-index: 10;
}

.rad-info-box .heading {
  font-size: 1.2em;
  font-weight: 300;
  text-transform: uppercase;
}

.rad-info-box .value {
  font-size: 2.1em;
  font-weight: 600;
  margin-top: 5px;
}

.rad-list-group-item {
  margin: 5px 10px 25px 5px;
}
.rad-list-group-item:after {
  content: "";
  display: table;
}

.rad-chat {
  border: 1px solid rgba(198, 198, 198, 0.5);
  padding: 0 10px;
  border-radius: 2px;
  position: relative;
}

.rad-chat-body {
  position: relative;
}

.rad-list-group-item.left .rad-chat {
  margin-left: 50px;
}
.rad-list-group-item.left .rad-chat .sm-text {
  float: right;
}
.rad-list-group-item.left .rad-chat:after {
  content: "";
  border-top: 1px solid rgba(198, 198, 198, 0.5);
  border-left: 1px solid rgba(198, 198, 198, 0.5);
  height: 10px;
  width: 10px;
  background: white;
  position: absolute;
  left: -6px;
  top: 10px;
  -webkit-transform: rotate(-45deg);
          transform: rotate(-45deg);
}

.rad-chat-msg {
  font-size: 14px;
  color: #585f69;
}

.rad-list-group-item.right .rad-chat {
  margin-right: 50px;
}
.rad-list-group-item.right .rad-chat .lg-text {
  float: right;
}
.rad-list-group-item.right .rad-chat:after {
  content: "";
  border-top: 1px solid rgba(198, 198, 198, 0.5);
  border-right: 1px solid rgba(198, 198, 198, 0.5);
  height: 10px;
  width: 10px;
  background: white;
  position: absolute;
  right: -6px;
  top: 10px;
  -webkit-transform: rotate(45deg);
          transform: rotate(45deg);
}

.rad-list-icon {
  position: relative;
  height: 40px;
  width: 40px;
  border-radius: 100%;
  line-height: 40px;
  text-align: center;
  color: white;
  top: -5px;
}

.icon-shadow {
  box-shadow: 0 0px 3px 1px rgba(0, 0, 0, 0.26);
}

.rad-list-img {
  border-radius: 100%;
  width: 32px;
  height: 32px;
}

.rad-list-group {
  position: relative;
}

.rad-list-group.group:before {
  content: "";
  position: absolute;
  background: rgba(198, 198, 198, 0.3);
  top: -20px;
  bottom: -20px;
  left: 25px;
  width: 1px;
}

.rad-list-content {
  line-height: 1.3;
  margin-left: 50px;
}

.rad-timeline {
  padding: 10px 0;
  position: relative;
}
.rad-timeline:before {
  content: "";
  position: absolute;
  border: 1px solid #c6c6c6;
  left: 50%;
  top: 0;
  height: 100%;
  bottom: 1px;
  box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.2);
}
.rad-timeline .rad-timeline-item {
  list-style: none;
  padding: 10px;
  position: relative;
  vertical-align: middle;
  margin-bottom: 20px;
  font-size: 14px;
}
.rad-timeline .rad-timeline-item .rad-timeline-badge {
  position: absolute;
  left: 50%;
  top: 0;
  margin-left: -15px;
  color: #FFF;
  width: 30px;
  height: 30px;
  font-size: 12px;
  border-radius: 100%;
  text-align: center;
  line-height: 25px;
  box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.2);
  cursor: pointer;
  -webkit-transition: all .2s easein-out;
  transition: all .2s easein-out;
  border: 2px solid #fff;
}
.rad-timeline .rad-timeline-item .rad-timeline-badge span {
  -webkit-transition: all 200ms linear;
  transition: all 200ms linear;
  -webkit-transform: scale(0);
          transform: scale(0);
  opacity: 0;
  position: absolute;
  color: #e6e6e6;
  background: Grey;
  min-width: 70px;
  border-radius: 3px;
}
.rad-timeline .rad-timeline-item .rad-timeline-badge span.pull-right {
  right: 35px;
}
.rad-timeline .rad-timeline-item .rad-timeline-badge span.pull-left {
  left: 35px;
}
.rad-timeline .rad-timeline-item .rad-timeline-badge:hover span {
  opacity: 1;
  -webkit-transform: scale(1);
          transform: scale(1);
}
.rad-timeline .rad-timeline-item .rad-timeline-panel {
  position: relative;
  width: 40%;
  background: #FFF;
  padding: 15px;
  top: -20px;
  margin-left: 10px;
  border-radius: 6px;
  border: 1px solid rgba(0, 0, 0, 0.2);
}
.rad-timeline .rad-timeline-item .rad-timeline-panel:after {
  content: "";
  width: 15px;
  height: 15px;
  background: #FFF;
  position: absolute;
  top: 30px;
  right: -8.5px;
  margin-top: -10px;
  -webkit-transform: rotate(135deg);
          transform: rotate(135deg);
  border-top: 1px solid rgba(0, 0, 0, 0.2);
  border-left: 1px solid rgba(0, 0, 0, 0.2);
}
.rad-timeline .rad-timeline-item:before {
  content: "";
  display: table;
}
.rad-timeline .rad-timeline-item:after {
  content: "";
  clear: both;
  display: block;
  overflow: hidden;
}
.rad-timeline .rad-timeline-item:first-child {
  margin-top: 20px;
}
.rad-timeline .rad-timeline-item .pull-right.rad-timeline-panel {
  background: #e6e6e6;
  margin-right: 10px;
}
.rad-timeline .rad-timeline-item .pull-right.rad-timeline-panel:after {
  content: "";
  left: -8.5px;
  -webkit-transform: rotate(-45deg);
          transform: rotate(-45deg);
  background: #e6e6e6;
}

.rad-timeline-footer p {
  display: inline-block;
  font-weight: 600;
  color: #515d6e;
}
.rad-timeline-footer p i {
  font-size: 24px;
  color: crimson;
}

.rad-chart .morris-hover {
  display: none !important;
}

.rad-chart:hover .morris-hover {
  display: block !important;
}

.fa-spin {
  -webkit-animation: fa-spin .5s infinite linear;
  animation: fa-spin .5s infinite linear;
}

.brand-icon {
  font-size: 22px;
  height: 50px;
  display: inline-block;
  float: left;
  width: 50px;
  background-color: crimson;
  text-align: center;
  line-height: 50px;
  color: white;
  font-weight: 700;
  -webkit-transition: all .2s linear;
  transition: all .2s linear;
  margin-left: -230px;
  display: none;
}

.flat-theme body {
  background: #f1f2f7;
}
.flat-theme .brand-icon {
  display: inline-block;
}
.flat-theme .rad-logo {
  color: white;
}
.flat-theme .rad-navigation {
  text-align: left;
}
.flat-theme .rad-navigation .rad-top-nav-container {
  float: none !important;
}
.flat-theme .rad-navigation .rad-top-nav-container .links:last-child {
  float: none !important;
}
.flat-theme .rad-navigation .rad-top-nav-container .links:last-child > li > ul.rad-dropmenu-item {
  left: 0;
}
.flat-theme .rad-navigation .rad-top-nav-container .links:last-child > li > ul.rad-dropmenu-item:before {
  left: 8px;
  right: 100%;
}
.flat-theme .rad-navigation .rad-top-nav-container .links:last-child > li:first-child {
  margin-left: 30px;
}
.flat-theme .rad-navigation .rad-top-nav-container .links > li {
  text-align: center;
}
.flat-theme .rad-navigation .rad-top-nav-container .links > li > a {
  border-radius: 50%;
  width: 32px;
  height: 32px;
  background: #f6f6f6;
  display: inline-block;
  line-height: 32px;
}
.flat-theme .rad-navigation .rad-top-nav-container .links > li:hover > a {
  color: white !important;
}
.flat-theme .rad-dropmenu-item {
  border-color: crimson !important;
}
.flat-theme .rad-dropmenu-item:before {
  border-color: crimson transparent;
}
.flat-theme .rad-logo-container.rad-nav-min {
  -webkit-transform: none;
          transform: none;
}
.flat-theme .rad-logo-container.rad-nav-min .rad-logo {
  opacity: 1;
}
.flat-theme .rad-logo-container.rad-nav-min + .rad-logo-hidden {
  opacity: 0;
}
.flat-theme .rad-logo-container {
  background: crimson !important;
  position: relative;
  z-index: 1000;
}
.flat-theme .rad-logo-container .rad-toggle-btn {
  color: #fff !important;
  font-size: 14px;
  width: 30px;
  height: 30px;
  display: inline-block;
  position: absolute;
  line-height: 30px;
  text-align: center;
  padding: 0;
  border-radius: 50%;
  right: -15px;
  background: red;
  top: 7.5px;
  -webkit-transition: all .2s linear;
  transition: all .2s linear;
}
.flat-theme .rad-sidebar {
  background: #32323a !important;
}
.flat-theme .rad-sidebar li {
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
}
.flat-theme .rad-sidebar li:hover {
  background: #28282a !important;
}
.flat-theme .rad-sidebar li:hover span {
  color: crimson !important;
}
.flat-theme .rad-sidebar li a i {
  color: white;
}
.flat-theme .rad-sidebar li a > span {
  color: #aeb2b7 !important;
  -webkit-transition: none;
}
.flat-theme .rad-info-box {
  box-shadow: none !important;
  border-radius: 4px;
}
.flat-theme .panel {
  box-shadow: none !important;
  border-radius: 4px !important;
  border: none !important;
}
.flat-theme .panel .panel-heading {
  background: #fafafa !important;
  border-top-left-radius: 4px;
  border-top-right-radius: 4px;
}
.flat-theme .panel .panel-body {
  border-bottom-left-radius: 4px;
  border-bottom-right-radius: 4px;
}
.flat-theme .panel-default {
  border-color: none;
}

.rad-bg-crimson {
  background: crimson;
}

.flat-theme.crimson .rad-logo-container {
  background: crimson !important;
}
.flat-theme.crimson .rad-toggle-btn {
  background: #ad102f !important;
}
.flat-theme.crimson .rad-dropmenu-footer,
.flat-theme.crimson .rad-dropmenu-header {
  background: #ad102f !important;
}
.flat-theme.crimson .links > li:not(.no-color):hover > a {
  background: #eb1f48 !important;
}
.flat-theme.crimson .rad-dropmenu-item {
  border-color: #ad102f !important;
}
.flat-theme.crimson .rad-dropmenu-item:before {
  border-color: #ad102f transparent;
}
.flat-theme.crimson .rad-sidebar li:hover a > span {
  color: crimson !important;
}
@media screen and (max-width: 850px) {
  .flat-theme.crimson.sticky .rad-toggle-btn {
    background: #fafafa !important;
    color: #89949B !important;
  }
}
.flat-theme.crimson.sticky .brand-icon,
.flat-theme.crimson.sticky .rad-toggle-btn:hover {
  background: crimson !important;
  color: #fff !important;
}

.rad-bg-teal {
  background: #1fb5ad;
}

.flat-theme.teal .rad-logo-container {
  background: #1fb5ad !important;
}
.flat-theme.teal .rad-toggle-btn {
  background: #188983 !important;
}
.flat-theme.teal .rad-dropmenu-footer,
.flat-theme.teal .rad-dropmenu-header {
  background: #188983 !important;
}
.flat-theme.teal .links > li:not(.no-color):hover > a {
  background: #23cbc2 !important;
}
.flat-theme.teal .rad-dropmenu-item {
  border-color: #188983 !important;
}
.flat-theme.teal .rad-dropmenu-item:before {
  border-color: #188983 transparent;
}
.flat-theme.teal .rad-sidebar li:hover a > span {
  color: #1fb5ad !important;
}
@media screen and (max-width: 850px) {
  .flat-theme.teal.sticky .rad-toggle-btn {
    background: #fafafa !important;
    color: #89949B !important;
  }
}
.flat-theme.teal.sticky .brand-icon,
.flat-theme.teal.sticky .rad-toggle-btn:hover {
  background: #1fb5ad !important;
  color: #fff !important;
}

.rad-bg-orange {
  background: #ff503f;
}

.flat-theme.orange .rad-logo-container {
  background: #ff503f !important;
}
.flat-theme.orange .rad-toggle-btn {
  background: #ff220c !important;
}
.flat-theme.orange .rad-dropmenu-footer,
.flat-theme.orange .rad-dropmenu-header {
  background: #ff220c !important;
}
.flat-theme.orange .links > li:not(.no-color):hover > a {
  background: #ff6759 !important;
}
.flat-theme.orange .rad-dropmenu-item {
  border-color: #ff220c !important;
}
.flat-theme.orange .rad-dropmenu-item:before {
  border-color: #ff220c transparent;
}
.flat-theme.orange .rad-sidebar li:hover a > span {
  color: #ff503f !important;
}
@media screen and (max-width: 850px) {
  .flat-theme.orange.sticky .rad-toggle-btn {
    background: #fafafa !important;
    color: #89949B !important;
  }
}
.flat-theme.orange.sticky .brand-icon,
.flat-theme.orange.sticky .rad-toggle-btn:hover {
  background: #ff503f !important;
  color: #fff !important;
}

.rad-bg-purple {
  background: rebeccapurple;
}

.flat-theme.purple .rad-logo-container {
  background: rebeccapurple !important;
}
.flat-theme.purple .rad-toggle-btn {
  background: #4d2673 !important;
}
.flat-theme.purple .rad-dropmenu-footer,
.flat-theme.purple .rad-dropmenu-header {
  background: #4d2673 !important;
}
.flat-theme.purple .links > li:not(.no-color):hover > a {
  background: #7339ac !important;
}
.flat-theme.purple .rad-dropmenu-item {
  border-color: #4d2673 !important;
}
.flat-theme.purple .rad-dropmenu-item:before {
  border-color: #4d2673 transparent;
}
.flat-theme.purple .rad-sidebar li:hover a > span {
  color: rebeccapurple !important;
}
@media screen and (max-width: 850px) {
  .flat-theme.purple.sticky .rad-toggle-btn {
    background: #fafafa !important;
    color: #89949B !important;
  }
}
.flat-theme.purple.sticky .brand-icon,
.flat-theme.purple.sticky .rad-toggle-btn:hover {
  background: rebeccapurple !important;
  color: #fff !important;
}

.rad-bg-twitter {
  background: #55acee;
}

.flat-theme.twitter .rad-logo-container {
  background: #55acee !important;
}
.flat-theme.twitter .rad-toggle-btn {
  background: #2795e9 !important;
}
.flat-theme.twitter .rad-dropmenu-footer,
.flat-theme.twitter .rad-dropmenu-header {
  background: #2795e9 !important;
}
.flat-theme.twitter .links > li:not(.no-color):hover > a {
  background: #6cb7f0 !important;
}
.flat-theme.twitter .rad-dropmenu-item {
  border-color: #2795e9 !important;
}
.flat-theme.twitter .rad-dropmenu-item:before {
  border-color: #2795e9 transparent;
}
.flat-theme.twitter .rad-sidebar li:hover a > span {
  color: #55acee !important;
}
@media screen and (max-width: 850px) {
  .flat-theme.twitter.sticky .rad-toggle-btn {
    background: #fafafa !important;
    color: #89949B !important;
  }
}
.flat-theme.twitter.sticky .brand-icon,
.flat-theme.twitter.sticky .rad-toggle-btn:hover {
  background: #55acee !important;
  color: #fff !important;
}


</style>

</head>
<body style="font-family: 'MapoPeacefull';">
<!-- partial:index.partial.html -->
<section>
	<header>
		<nav class="rad-navigation">
			<div class="rad-logo-container rad-nav-min">
				<a href="#" class="rad-logo"><i class=" fa fa-recycle"></i> huba huba!</a>
				<a href="#" class="rad-toggle-btn pull-right"><i class="fa fa-bars"></i></a>
			</div>
			<a href="#" class="rad-logo-hidden">huba huba!</a>
			<div class="rad-top-nav-container">
				<a href="" class="brand-icon"><i class="fa fa-recycle"></i></a>
				<ul class="pull-right links">
					<li class="rad-dropdown no-color">
						<a class="rad-menu-item" href="#"><img class="rad-list-img sm-img" src="resources/img/${profile_img }" alt="me" /></a>
						<ul class="rad-dropmenu-item sm-menu">
							<li class="rad-notification-item">
								<a class="rad-notification-content lg-text" href="${pageContext.request.contextPath}/editUser"><i class="fa fa-edit"></i> Edit Profile</a>
							</li>
							<li class="rad-notification-item">
								<a class="rad-notification-content lg-text" href="${pageContext.request.contextPath}/logout"><i class="fa fa-power-off"></i> Sign out</a>
							</li>
						</ul>
					</li>
					<li class="rad-dropdown"><a class="rad-menu-item" href="#"><i class="fa fa-cog"></i></a>
						<ul class="rad-dropmenu-item rad-settings">
							<li class="rad-dropmenu-header"><a href="#">Settings</a></li>
							<li class="rad-notification-item text-left">
								<div class="pull-left"><i class="fa fa-link"></i></div>
								<div class="pull-right">
									<label class="rad-chk-pin pull-right">
										<input type="checkbox" /><span></span></label>
								</div>
								<div class="rad-notification-body">
									<div class="lg-text">Change to Flat Theme</div>
									<div class="sm-text">Flattify it</div>
								</div>
							</li>
							<li id="rad-color-opts" class="rad-notification-item text-left hide">
								<div class="pull-left"><i class="fa fa-puzzle-piece"></i></div>
								<div class="pull-right">
									<div class="rad-color-swatch">
										<label class="colors rad-bg-crimson rad-option-selected">
											<input type="radio" checked name="color" value="crimson" />
										</label>
										<label class="colors rad-bg-teal">
											<input type="radio" name="color" value="teal" />
										</label>
										<label class="colors rad-bg-purple">
											<input type="radio" name="color" value="purple">
										</label>
										<label class="colors rad-bg-orange">
											<input type="radio" name="color" value="orange" />
										</label>
										<label class="colors rad-bg-twitter">
											<input type="radio" name="color" value="twitter" />
										</label>
									</div>
								</div>
								<div class="rad-notification-body">
									<div class="lg-text">Choose a color</div>
									<div class="sm-text">Make it colorful</div>
								</div>
							</li>
						</ul>
					</li>
				</ul>
				<ul class="pull-right links">
					<li>
						<a class="rad-menu-item" href="#"><i class="fa fa-comment-o"><span class="rad-menu-badge rad-bg-success">0</span></i></a>
					</li>
					<li class="rad-dropdown"><a class="rad-menu-item" href="#"><i class="fa fa-envelope-o"><span class="rad-menu-badge rad-bg-primary">23</span></i></a>
						<ul class="rad-dropmenu-item">
							<li class="rad-dropmenu-header"><a href="#">Your Notifications</a></li>
							<li class="rad-notification-item text-left">
								<a class="rad-notification-content" href="#">
									<div class="pull-left"><i class="fa fa-html5 fa-2x"></i>
									</div>
									<div class="rad-notification-body">
										<div class="lg-text">Introduction to fetch()</div>
										<div class="sm-text">The fetch API</div>
									</div>
								</a>
							</li>
							<li class="rad-notification-item text-left">
								<a class="rad-notification-content" href="#">
									<div class="pull-left"><i class="fa fa-bitbucket fa-2x"></i>
									</div>
									<div class="rad-notification-body">
										<div class="lg-text">Check your BitBucket</div>
										<div class="sm-text">Last Chance</div>
									</div>
								</a>
							</li>
							<li class="rad-notification-item text-left">
								<a class="rad-notification-content" href="#">
									<div class="pull-left"><i class="fa fa-google fa-2x"></i>
									</div>
									<div class="rad-notification-body">
										<div class="lg-text">Google Account</div>
										<div class="sm-text">sathishlxg@gmail.com</div>
									</div>
								</a>
							</li>
							<li class="rad-dropmenu-footer"><a href="#">See all notifications</a></li>
						</ul>
					</li>
					<li class="rad-dropdown"><a class="rad-menu-item" href="#"><i class="fa fa-bell-o"><span class="rad-menu-badge">49</span></i></a>
						<ul class="rad-dropmenu-item">
							<li class="rad-dropmenu-header"><a href="#">Your Alerts</a></li>
							<li class="rad-notification-item text-left">
								<a class="rad-notification-content" href="#">
									<div class="pull-left"><i class="fa fa-html5 fa-2x"></i>
									</div>
									<div class="rad-notification-body">
										<div class="lg-text">Introduction to fetch()</div>
										<div class="sm-text">The fetch API</div>
										<em class="pull-right sm-text"><i class="fa fa-clock-o"></i> 2 sec ago</em>
									</div>
								</a>
							</li>
							<li class="rad-notification-item text-left">
								<a class="rad-notification-content" href="#">
									<div class="pull-left"><i class="fa fa-bitbucket fa-2x"></i>
									</div>
									<div class="rad-notification-body">
										<div class="lg-text">Check your BitBucket</div>
										<div class="sm-text">Last Chance</div>
										<em class="pull-right sm-text"><i class="fa fa-clock-o"></i> 49 mins ago</em>
									</div>
								</a>
							</li>
							<li class="rad-notification-item text-left">
								<a class="rad-notification-content" href="#">
									<div class="pull-left"><i class="fa fa-google fa-2x"></i>
									</div>
									<div class="rad-notification-body">
										<div class="lg-text">Google Account</div>
										<div class="sm-text">sathishlxg@gmail.com</div>
										<em class="pull-right sm-text"><i class="fa fa-clock-o"></i> 2 days ago</em>
									</div>
								</a>
							</li>
							<li class="rad-dropmenu-footer"><a href="#">See all alerts</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
	</header>
</section>
<aside>
	<nav class="rad-sidebar rad-nav-min">
		<ul>
			<li>
				<a href="#" class="inbox">
					<i class="fa fa-dashboard"><span class="icon-bg rad-bg-success"></span></i>
					<span class="rad-sidebar-item">관리자페이지</span>
				</a>
			</li>
			<li>
				<a href="#">
					<i class="fa fa-bar-chart-o">
						<span class="icon-bg rad-bg-danger"></span>
					</i>
					<span class="rad-sidebar-item">Ticket status</span>
				</a>
			</li>
			<li><a href="#" class="snooz"><i class="fa fa-line-chart"><span class="icon-bg rad-bg-primary"></span></i><span class="rad-sidebar-item">Call trends</span></a></li>
			<li><a href="#" class="done"><i class="fa fa-area-chart"><span class="icon-bg rad-bg-warning"></span></i><span class="rad-sidebar-item">Heat maps</span></a></li>
			<li>
				<a href="#">
					<i class="fa fa-wrench"><span class="icon-bg rad-bg-violet"></span></i>
					<span class="rad-sidebar-item">Settings</span>
				</a>
			</li>
		</ul>
	</nav>
</aside>
<main>
	<section>
		<div class="rad-body-wrapper rad-nav-min">
			<div class="container-fluid">
				<header class="rad-page-title">
					<span>관리자페이지</span>
					<small class="md-txt">Welcome to Hubahuba!, <a href="https://www.google.com/maps/place/3720+Emerald+St,+Torrance,+CA+90503/@33.8403836,-118.3543828,17z/data=!4m18!1m15!4m14!1m6!1m2!1s0x80c2b4d407f58b11:0xdedca55964c89054!2s3720+Emerald+St,+Torrance,+CA+90503!2m2!1d-118.3520761!2d33.8403792!1m6!1m2!1s0x80c2b4d407f58b11:0xdedca55964c89054!2s3720+Emerald+St,+Torrance,+CA+90503!2m2!1d-118.3520761!2d33.8403792!3m1!1s0x80c2b4d407f58b11:0xdedca55964c89054" target="_blank"><i class="fa fa-map-marker rad-txt-danger"></i> 신촌역</a></small>					</header>
				<div class="row">
					<div class="col-lg-3 col-xs-6">
						<div class="rad-info-box rad-txt-success">
							<i class="fa fa-windows"></i>
							<span class="heading">Microsoft</span>
							<span class="value"><span>4949</span></span>
						</div>
					</div>
					<div class="col-lg-3 col-xs-6">
						<div class="rad-info-box rad-txt-primary">
							<i class="fa fa-facebook"></i>
							<span class="heading">Facebook</span>
							<span class="value"><span>23K</span></span>
						</div>
					</div>
					<div class="col-lg-3 col-xs-6">
						<div class="rad-info-box rad-txt-danger">
							<i class="fa fa-google-plus"></i>
							<span class="heading">Google</span>
							<span class="value"><span>49M</span></span>
						</div>
					</div>
					<div class="col-lg-3 col-xs-6">
						<div class="rad-info-box">
							<i class="fa fa-apple"></i>
							<span class="heading">Apple</span>
							<span class="value"><span>10.9K</span></span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-lg-6">
						<div class="panel panel-default" style="overflow:scroll;">
							<div class="panel-heading">
								<h3 class="panel-title">메뉴 관리<ul class="rad-panel-action">
																	<li><i class="fa fa-chevron-down"></i></li>
																	<li><i class="fa fa-rotate-right"></i></li>
																	<li><i class="fa fa-cog"></i>
																	<li><i class="fa fa-close"></i>
																	</li>
																</ul></h3>
							</div>
							<div class="panel-body rad-map-container">
								<table class="table table-bordered">
								  <thead>
								    <tr>
								      <th scope="col">#</th>
								      <th scope="col">업소명</th>
								      <th scope="col">메뉴</th>
								      <th scope="col">가격</th>
								      <th></th>
								    </tr>
								  </thead>
								  <tbody>
								  <c:forEach var="TempMenu" items="${TempMenu}">
									    <tr>
									      <th scope="row">${TempMenu.idx} </th>
									      <td>${TempMenu.place_name}</td>
									      <td>${TempMenu.menu_name}</td>
									       <td>${TempMenu.menu_price}</td>
									      
									      <td style="width: 180px;">
									      	<img src="resources/img/verify.png" style="height: 30px;" onclick="location.href='${pageContext.request.contextPath}/adminMenuedit?business_idx=${TempMenu.business_idx}&menu_name=${TempMenu.menu_name}&menu_price=${TempMenu.menu_price}&idx=${TempMenu.idx}'">
									
									      	<img src="resources/img/trashbean.png" style="height: 30px;"onclick="location.href='${pageContext.request.contextPath}/adminMenuDelete?idx=${TempMenu.idx}'">
									      </td>
									    </tr>
								   </c:forEach>
								  </tbody>
								</table>
								
							</div>
						</div>
					</div>
					
					
					
			<div class="col-md-6 col-lg-6">
			<div class="panel panel-default" style="overflow:scroll;">
				<div class="panel-heading">
					<h3 class="panel-title">시간 수정<ul class="rad-panel-action">
					<li><i class="fa fa-chevron-down"></i></li>
					<li><i class="fa fa-rotate-right"></i></li>
					<li><i class="fa fa-cog"></i>
					</li><li><i class="fa fa-close"></i>
					</li>
					</ul></h3>
				</div>
				<div class="panel-body rad-map-container">
					<table class="table table-bordered">
								  <thead>
								    <tr>
								      <th scope="col">#</th>
								      <th scope="col">업소명</th>
								      <th scope="col">요일</th>
								      <th scope="col">오픈시간</th>
								      <th scope="col">마감시간</th>
								      <th></th>
								    </tr>
								  </thead>
								  <tbody>
								   <c:forEach var="TempHours" items="${TempHours}">
									    <tr>
									    
									      <th scope="row">${TempHours.idx} </th>
									      <td>${TempHours.place_name}</td>
									      <td>${TempHours.days}</td>
									       <td>${TempHours.open}</td>
									     <td>${TempHours.close}</td>
									      <td style="width: 180px;">
									      	<img src="resources/img/verify.png" style="height: 30px;" onclick="location.href='${pageContext.request.contextPath}/adminHouredit?idx=${TempHours.idx}&business_idx=${TempHours.business_idx}&open=${TempHours.open}&close=${TempHours.close}&days=${TempHours.days}'">
									      	<img src="resources/img/trashbean.png" style="height: 30px;" onclick="location.href='${pageContext.request.contextPath}/adminHourDelete?idx=${TempHours.idx}'">
									      </td>
									    </tr>
									</c:forEach>
								  </tbody>
								</table>
				</div>
			</div>
		</div>
		
		
		
		<div class="col-xs-12">
			<div class="panel panel-default" style="overflow:scroll;">
				<div class="panel-heading">
					<h3 class="panel-title">
					Add Place
						<ul class="rad-panel-action">
							<li><i class="fa fa-chevron-down"></i></li>
							<li><i class="fa fa-rotate-right"></i></li>
							<li><i class="fa fa-cog"></i>
							<li><i class="fa fa-close"></i>
							</li>
						</ul>
					</h3>
				</div>
				<div class="panel-body rad-map-container">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">가게 이름</th>
								<th scope="col">가게 주소</th>
								<th scope="col">가게 번호</th>
								<th scope="col">X</th>
								<th scope="col">Y</th>
								<th scope="col">카테고리</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="TempPlace" items="${TempPlace}">
								<tr>
									<th scope="row">${TempPlace.idx} </th>
									<td>${TempPlace.place_name}</td>
									<td>${TempPlace.road_address_name}</td>
									<td>${TempPlace.phone}</td>
									<td>${TempPlace.x}</td>
									<td>${TempPlace.y}</td>
									<td>${TempPlace.category_group_name}</td>
									<td style="width: 180px;">
										<img src="resources/img/verify.png" style="height: 30px;" onclick="location.href='${pageContext.request.contextPath}/adminInsertBusiness?p_idx=${TempPlace.idx}&p_name=${TempPlace.place_name}&p_address=${TempPlace.road_address_name}&p_phone=${TempPlace.phone}&p_category=${TempPlace.category_group_name}&p_x=${TempPlace.x}&p_y=${TempPlace.y}'">
										<img src="resources/img/trashbean.png" style="height: 30px;" onclick="location.href='${pageContext.request.contextPath}/adminDeleteTempPlaceList?p_idx=${TempPlace.idx}'">
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>		
				</div>
			</div>			
		</div>
				
				
				
				</div>
			
				
<script>
function adminMenuedit(){
	alert('confirm');
}

function adminMenudelete(){
	alert('deleted');
}
function adminHoursedit(){
	alert('deleted');
}
function adminHoursdelete(){
	alert('deleted');
}


</script>
	
				
					
			
			</div>
		</div>
	</section>
</main>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js'></script>
<script src='https://code.jquery.com/ui/1.11.4/jquery-ui.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.3/jquery.slimscroll.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.8.0/lodash.min.js'></script>
<script src='https://jvectormap.com/js/jquery-jvectormap-2.0.5.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.5/d3.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jvectormap/2.0.3/jquery-jvectormap.js'></script>
<script src='https://jvectormap.com/js/jquery-jvectormap-world-mill.js'></script>
<script  src="resources/js/script.js"></script>

</body>
</html>
