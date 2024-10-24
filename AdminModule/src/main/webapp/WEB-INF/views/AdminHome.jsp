<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - PlayStore</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1a73e8;
            --secondary-color: #34a853;
            --danger-color: #ea4335;
            --warning-color: #fbbc05;
            --navbar-height: 60px;
            --footer-height: 56px;
            --sidebar-width: 250px;
        }
        
        /* Reset some base styles */
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            overflow-x: hidden;
        }
        
        /* Navbar base styles */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: var(--navbar-height);
            z-index: 1030;
        }
        
        /* Page container adjustments */
        .page-container {
            padding-top: var(--navbar-height);
            min-height: calc(100vh - var(--navbar-height));
            display: flex;
        }
        
        /* Sidebar adjustments */
        .sidebar {
            position: fixed;
            top: var(--navbar-height);
            left: 0;
            width: var(--sidebar-width);
            height: calc(100vh - var(--navbar-height) - var(--footer-height));
            overflow-y: auto;
            display: none;  /* Hide on mobile */
        }
        
        /* Main Content Styles */
        .main-content {
            flex: 1;
            margin-left: var(--sidebar-width);
            padding: 20px;
            min-height: calc(100vh - var(--navbar-height) - var(--footer-height));
        }
        
        /* Dashboard Content Container */
        .dashboard-container {
            flex: 1 0 auto;
            padding-bottom: 20px;
        }
        
        /* Search Box Styles */
        .search-box {
            padding: 1.25rem 1rem;
            border-bottom: 1px solid #eee;
        }
        
        .search-input {
            width: 100%;
            padding: 0.5rem 1rem;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 0.9rem;
            color: #333;
            background-color: #f8f9fa;
            transition: all 0.3s ease;
        }
        
        .search-input:focus {
            outline: none;
            border-color: var(--primary-color);
            background-color: white;
            box-shadow: 0 0 0 3px rgba(26, 115, 232, 0.1);
        }
        
        .search-input::placeholder {
            color: #999;
            font-size: 0.9rem;
        }
        
        /* Sidebar Menu Styles */
        .sidebar-menu {
            padding: 1rem 0;
        }
        
        .menu-title {
            padding: 0 1rem;
            margin-bottom: 0.5rem;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
            color: #666;
        }
        
        .menu-items {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .menu-items li {
            padding: 0.5rem 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            color: #333;
        }
        
        .menu-items li:hover {
            background-color: #f8f9fa;
            color: var(--primary-color);
        }
        
        .menu-items li i {
            width: 20px;
            margin-right: 10px;
            font-size: 1rem;
        }
        
        /* Existing dashboard styles remain the same */
        
        /* Add these additional styles for the main content */
        .dashboard-stats {
            margin-bottom: 2rem;
        }
        
        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 1rem;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }
        
        .stat-icon {
            font-size: 1.5rem;
            min-width: 40px;
            text-align: center;
        }
        
        .stat-number {
            font-size: 1.25rem;
            font-weight: bold;
            line-height: 1.2;
        }
        
        .stat-label {
            color: #666;
            font-size: 0.8rem;
        }
        
        .quick-actions {
            margin-top: 2rem;
        }
        
        .action-card {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }
        
        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .recent-activity {
            margin-top: 2rem;
        }
        
        .activity-item {
            padding: 1rem;
            border-bottom: 1px solid #eee;
        }
        
        .activity-item:last-child {
            border-bottom: none;
        }
        
        /* Sidebar Toggle Button */
        .sidebar-toggle {
            display: none;
            position: fixed;
            left: 10px;
            bottom: 20px;
            z-index: 1030;
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: var(--primary-color);
            color: white;
            border: none;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .sidebar-toggle:hover {
            background: #1557b0;
            transform: scale(1.05);
        }

        /* Overlay for mobile */
        .sidebar-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0,0,0,0.5);
            z-index: 1040;
        }

        /* Responsive Styles */
        @media (max-width: 991px) {
            .sidebar {
                position: fixed;
                left: -250px;
                top: var(--navbar-height);
                height: calc(100vh - var(--navbar-height));
                z-index: 1050;
                transition: left 0.3s ease;
            }

            .sidebar.active {
                left: 0;
            }

            .sidebar-toggle {
                display: block;
            }

            .main-content {
                width: 100%;
                margin-left: 0;
            }

            .sidebar-overlay.active {
                display: block;
            }

            /* Adjust stats cards for mobile */
            .dashboard-stats .col-md-3 {
                margin-bottom: 1rem;
            }

            /* Adjust quick action cards for mobile */
            .quick-actions .col-md-6 {
                margin-bottom: 1rem;
            }
        }

        /* Small screens */
        @media (max-width: 576px) {
            .stat-card {
                padding: 1rem;
            }

            .stat-number {
                font-size: 1.5rem;
            }

            .action-card {
                padding: 1rem;
            }
        }

        /* Mobile Menu Styles */
        @media (max-width: 991px) {
            .navbar {
                position: fixed;
                width: 100%;
                z-index: 1030;
            }

            .navbar-collapse {
                background: white;
                position: fixed;
                top: var(--navbar-height);
                left: 0;
                right: 0;
                bottom: 0;
                padding: 1rem;
                z-index: 1020;
                overflow-y: auto;
            }
            
            .search-box-mobile {
                padding: 0.5rem 0;
                border-bottom: 1px solid #eee;
                margin-bottom: 1rem;
            }
            
            .search-box-mobile .form-control {
                padding: 0.875rem 1rem;
                font-size: 1rem;
                border-radius: 8px;
                border: 1px solid #e0e0e0;
                background-color: #f8f9fa;
            }
            
            .mobile-section-title {
                color: #666;
                font-size: 0.8rem;
                font-weight: 600;
                text-transform: uppercase;
                padding: 0 1rem;
                margin-bottom: 0.5rem;
            }
            
            .navbar-nav .nav-link {
                color: #333 !important;
                padding: 1rem;
                font-size: 1.1rem;
                border-radius: 8px;
                display: flex;
                align-items: center;
            }
            
            .navbar-nav .nav-link i {
                font-size: 1.2rem;
                width: 24px;
                margin-right: 15px;
            }
            
            .navbar-nav .nav-link:hover {
                background-color: #f8f9fa;
                color: var(--primary-color) !important;
            }
            
            .navbar-nav .nav-link.active {
                background-color: var(--primary-color);
                color: white !important;
            }
            
            .navbar-toggler:focus {
                box-shadow: none;
            }
            
            /* Adjust main content padding for fixed navbar */
            .page-container {
                padding-top: calc(var(--navbar-height) + 1rem);
            }
        }

        /* Footer Styles */
        .footer {
            background-color: white;
            border-top: 1px solid #eee;
            height: var(--footer-height);
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
        }
        
        .footer p {
            color: #666;
            font-size: 0.9rem;
            margin: 0;
        }
        
        /* Scrollbar Styles for Sidebar */
        .sidebar::-webkit-scrollbar {
            width: 6px;
        }
        
        .sidebar::-webkit-scrollbar-track {
            background: #f1f1f1;
        }
        
        .sidebar::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 3px;
        }
        
        .sidebar::-webkit-scrollbar-thumb:hover {
            background: #555;
        }
        
        /* Mobile Styles */
        @media (max-width: 991px) {
            .sidebar {
                display: none;
            }
            
            .main-content {
                margin-left: 0;
                padding: 15px;
            }
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .dashboard-stats .col-md-3 {
                margin-bottom: 1rem;
            }
            
            .stat-card {
                padding: 0.75rem;
            }
            
            .stat-icon {
                font-size: 1.25rem;
            }
            
            .stat-number {
                font-size: 1.25rem;
            }
            
            .stat-label {
                font-size: 0.8rem;
            }
        }

        /* Section Titles */
        .section-title {
            color: #333;
            font-weight: 500;
        }

        /* Quick Action Cards */
        .action-card {
            background: white;
            border-radius: 10px;
            padding: 1.25rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            transition: transform 0.3s ease;
            height: 100%;
        }
        
        .action-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .action-card h6 {
            color: #333;
            font-weight: 500;
        }
        
        .action-card p {
            font-size: 0.9rem;
        }

        /* Statistics Cards */
        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 1rem;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }
        
        .stat-icon {
            font-size: 1.5rem;
            min-width: 40px;
            text-align: center;
        }
        
        .stat-number {
            font-size: 1.25rem;
            font-weight: bold;
            line-height: 1.2;
        }
        
        .stat-label {
            color: #666;
            font-size: 0.8rem;
        }

        @media (max-width: 768px) {
            .stat-card {
                padding: 0.875rem;
            }
            
            .stat-icon {
                font-size: 1.25rem;
                min-width: 35px;
            }
            
            .stat-number {
                font-size: 1.1rem;
            }
            
            .stat-label {
                font-size: 0.75rem;
            }
        }

        /* Add New Application Button */
        .btn-add {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 0.625rem 1.25rem;
            border-radius: 8px;
            font-size: 0.95rem;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        .btn-add:hover {
            background-color: #1557b0; /* Darker shade of primary color */
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }
        
        .btn-add:active {
            transform: translateY(0);
        }
        
        .btn-add i {
            color: white;
        }

        @media (max-width: 768px) {
            .btn-add {
                padding: 0.5rem 1rem;
                font-size: 0.9rem;
            }
        }

        /* Mobile Menu Styles */
        @media (max-width: 991px) {
            .navbar-collapse {
                background: white;
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                padding: 1rem;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                z-index: 1000;
            }
            
            .navbar-collapse.show,
            .navbar-collapse.collapsing {
                display: block;
            }
            
            .mobile-menu .nav-link {
                color: #333 !important;
                padding: 0.75rem 1rem;
                border-radius: 8px;
                transition: all 0.3s ease;
            }
            
            .mobile-menu .nav-link:hover {
                background-color: #f8f9fa;
                color: var(--primary-color) !important;
            }
            
            .mobile-menu .nav-link.active {
                background-color: var(--primary-color);
                color: white !important;
            }
            
            .search-box-mobile {
                padding: 0 1rem 1rem 1rem;
                margin-bottom: 0.5rem;
                border-bottom: 1px solid #eee;
            }
            
            .search-box-mobile .form-control {
                border-radius: 8px;
                padding: 0.5rem 1rem;
                border: 1px solid #e0e0e0;
                background-color: #f8f9fa;
            }
            
            .search-box-mobile .form-control:focus {
                box-shadow: none;
                border-color: var(--primary-color);
                background-color: white;
            }
            
            .navbar-toggler:focus {
                box-shadow: none;
            }
            
            .mobile-menu .nav-item {
                margin: 0.25rem 0;
            }
        }

        /* Mobile Menu Styles */
        @media (max-width: 991px) {
            /* Navbar toggler button */
            .navbar-toggler {
                padding: 0.5rem;
                font-size: 1.25rem;
            }

            /* Dropdown container */
            .navbar-collapse {
                background: white;
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                padding: 1rem;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                z-index: 1000;
            }
            
            /* Search box in mobile */
            .search-box-mobile {
                padding: 0 0.5rem 1rem 0.5rem;
                margin-bottom: 0.5rem;
                border-bottom: 1px solid #eee;
            }
            
            .search-box-mobile .form-control {
                border-radius: 8px;
                padding: 0.75rem 1rem;
                font-size: 1rem;
                border: 1px solid #e0e0e0;
                background-color: #f8f9fa;
            }
            
            /* Mobile menu items */
            .mobile-menu .nav-item {
                margin: 0.5rem 0;
            }
            
            .mobile-menu .nav-link {
                color: #333 !important;
                padding: 0.875rem 1rem;
                font-size: 1rem;
                border-radius: 8px;
                transition: all 0.3s ease;
                display: flex;
                align-items: center;
            }
            
            .mobile-menu .nav-link i {
                font-size: 1.1rem;
                width: 24px;
                margin-right: 12px;
            }
            
            .mobile-menu .nav-link:hover {
                background-color: #f8f9fa;
                color: var(--primary-color) !important;
            }
            
            .mobile-menu .nav-link.active {
                background-color: var(--primary-color);
                color: white !important;
            }

            /* Navbar brand adjustments */
            .navbar-brand {
                font-size: 1.25rem;
            }
            
            .navbar-brand i {
                font-size: 1.35rem;
            }
        }

        /* Small mobile devices */
        @media (max-width: 576px) {
            .mobile-menu .nav-link {
                padding: 1rem;
                font-size: 1.1rem;
            }
            
            .mobile-menu .nav-link i {
                font-size: 1.2rem;
                margin-right: 15px;
            }
            
            .search-box-mobile .form-control {
                padding: 0.875rem 1rem;
                font-size: 1.1rem;
            }
        }

        /* Mobile Menu Styles */
        @media (max-width: 991px) {
            .navbar-collapse {
                background: white;
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                padding: 1rem;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                max-height: calc(100vh - var(--navbar-height));
                overflow-y: auto;
            }

            /* Hide desktop menu */
            .d-none {
                display: none !important;
            }

            /* Mobile menu container */
            .mobile-menu {
                padding: 0;
            }

            /* Search box */
            .search-box-mobile {
                margin-bottom: 1rem;
                padding: 0;
            }

            .search-box-mobile .form-control {
                padding: 0.5rem 1rem;
                border-radius: 8px;
                border: 1px solid #e0e0e0;
                background-color: #f8f9fa;
            }

            /* Menu sections */
            .menu-section {
                margin-bottom: 1.5rem;
            }

            .menu-title {
                font-size: 0.8rem;
                font-weight: 600;
                color: #666;
                text-transform: uppercase;
                margin-bottom: 0.5rem;
                padding: 0 0.5rem;
            }

            .menu-items {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .menu-items li {
                padding: 0.75rem 1rem;
                color: #333;
                cursor: pointer;
                display: flex;
                align-items: center;
                border-radius: 8px;
                transition: all 0.3s ease;
            }

            .menu-items li:hover {
                background-color: #f8f9fa;
                color: var(--primary-color);
            }

            .menu-items li.active {
                background-color: var(--primary-color);
                color: white;
            }

            .menu-items li i {
                width: 24px;
                margin-right: 12px;
                font-size: 1.1rem;
            }

            /* Main content adjustments */
            .main-content {
                margin-left: 0;
                width: 100%;
            }
        }

        /* Navbar Styles */
        .navbar {
            background-color: var(--primary-color);
            padding: 0.5rem 1rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .navbar-brand {
            font-size: 1.25rem;
            font-weight: 500;
        }

        .navbar-dark .navbar-nav .nav-link {
            color: rgba(255,255,255,0.9) !important;
        }

        /* Mobile Menu Styles */
        @media (max-width: 991px) {
            .navbar-collapse {
                background: white;
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                padding: 1rem;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .search-box-mobile .form-control {
                padding: 0.5rem 1rem;
                border-radius: 8px;
                border: 1px solid #e0e0e0;
                background-color: #f8f9fa;
            }

            .menu-title {
                font-size: 0.8rem;
                font-weight: 600;
                color: #666;
                text-transform: uppercase;
                margin-bottom: 0.5rem;
                padding: 0 0.5rem;
            }

            .menu-items {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .menu-items li {
                padding: 0.75rem 1rem;
                color: #333;
                cursor: pointer;
                display: flex;
                align-items: center;
                border-radius: 8px;
                transition: all 0.3s ease;
            }

            .menu-items li:hover {
                background-color: #f8f9fa;
                color: var(--primary-color);
            }

            .menu-items li.active {
                background-color: var(--primary-color);
                color: white;
            }

            .menu-items li i {
                width: 24px;
                margin-right: 12px;
                font-size: 1.1rem;
            }

            .menu-section {
                margin-bottom: 1rem;
            }

            .menu-section:last-child {
                margin-bottom: 0;
            }
        }

        /* Layout */
        .page-container {
            padding-top: var(--navbar-height);
            min-height: calc(100vh - var(--navbar-height));
            display: flex;
        }

        .main-content {
            flex: 1;
            margin-left: var(--sidebar-width);
            padding: 2rem;
            background-color: #f8f9fa;
        }

        /* Section Titles */
        .section-title {
            color: #333;
            font-weight: 500;
            font-size: 1.25rem;
        }

        /* Table Styles */
        .table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .table thead th {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
            padding: 1rem;
            font-weight: 600;
            color: #333;
        }

        .table tbody td {
            padding: 1rem;
            vertical-align: middle;
        }

        /* Status Badges */
        .badge {
            padding: 0.5rem 0.75rem;
            border-radius: 6px;
            font-weight: 500;
        }

        .badge-success {
            background-color: #d4edda;
            color: #155724;
        }

        .badge-warning {
            background-color: #fff3cd;
            color: #856404;
        }

        /* Action Buttons */
        .btn-action {
            padding: 0.375rem 0.75rem;
            border-radius: 6px;
            font-size: 0.875rem;
        }

        /* Responsive Adjustments */
        @media (max-width: 991px) {
            .main-content {
                margin-left: 0;
                padding: 1rem;
            }
        }

    </style>
</head>
<body>
    <!-- Fixed Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="fas fa-play-circle me-2"></i>PlayStore
            </a>
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <!-- Desktop Menu -->
                <ul class="navbar-nav ms-auto d-none d-lg-flex">
                    <li class="nav-item">
                        <a class="nav-link active" href="#"><i class="fas fa-home me-1"></i>Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/application/list"><i class="fas fa-mobile-alt me-1"></i>Applications</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/profile"><i class="fas fa-user me-1"></i>Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/logout"><i class="fas fa-sign-out-alt me-1"></i>Logout</a>
                    </li>
                </ul>

                <!-- Mobile Menu -->
                <div class="d-lg-none">
                    <div class="mobile-menu">
                        <div class="search-box-mobile mb-3">
                            <input type="text" class="form-control" placeholder="Search applications...">
                        </div>
                        
                        <!-- Navigation Menu -->
                        <div class="menu-section mb-3">
                            <div class="menu-title">Navigation</div>
                            <ul class="menu-items">
                                <li class="active">
                                    <i class="fas fa-home"></i>Home
                                </li>
                                <li>
                                    <i class="fas fa-mobile-alt"></i>Applications
                                </li>
                                <li>
                                    <i class="fas fa-user"></i>Profile
                                </li>
                            </ul>
                        </div>

                        <!-- Categories Menu -->
                        <div class="menu-section">
                            <div class="menu-title">Categories</div>
                            <ul class="menu-items">
                                <li>
                                    <i class="fas fa-gamepad"></i>Games
                                </li>
                                <li>
                                    <i class="fas fa-spa"></i>Beauty
                                </li>
                                <li>
                                    <i class="fas fa-tshirt"></i>Fashion
                                </li>
                                <li>
                                    <i class="fas fa-female"></i>Women
                                </li>
                                <li>
                                    <i class="fas fa-heartbeat"></i>Health
                                </li>
                            </ul>
                        </div>

                        <!-- Logout -->
                        <div class="menu-section mt-3">
                            <ul class="menu-items">
                                <li>
                                    <i class="fas fa-sign-out-alt"></i>Logout
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div class="page-container">
        <!-- Sidebar -->
        <div class="sidebar d-none d-lg-block">
            <div class="search-box">
                <input type="text" class="search-input" placeholder="Search applications...">
            </div>
            <div class="sidebar-menu">
                <div class="menu-title">Categories</div>
                <ul class="menu-items">
                    <li>
                        <i class="fas fa-gamepad"></i>Games
                    </li>
                    <li>
                        <i class="fas fa-spa"></i>Beauty
                    </li>
                    <li>
                        <i class="fas fa-tshirt"></i>Fashion
                    </li>
                    <li>
                        <i class="fas fa-female"></i>Women
                    </li>
                    <li>
                        <i class="fas fa-heartbeat"></i>Health
                    </li>
                </ul>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Add New Application Button -->
            <div class="d-flex justify-content-end mb-4">
                <a href="/admin/application/add" class="btn btn-add">
                    <i class="fas fa-plus-circle me-2"></i>Add New Application
                </a>
            </div>

            <!-- Statistics Cards -->
            <div class="dashboard-stats">
                <div class="row g-3">
                    <div class="col-md-3 col-sm-6">
                        <div class="stat-card">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-mobile-alt stat-icon text-primary"></i>
                                <div class="ms-3">
                                    <div class="stat-number">1,234</div>
                                    <div class="stat-label">Total Apps</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="stat-card">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-download stat-icon text-success"></i>
                                <div class="ms-3">
                                    <div class="stat-number">5.2M</div>
                                    <div class="stat-label">Total Downloads</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="stat-card">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-users stat-icon text-warning"></i>
                                <div class="ms-3">
                                    <div class="stat-number">850K</div>
                                    <div class="stat-label">Active Users</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="stat-card">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-star stat-icon text-danger"></i>
                                <div class="ms-3">
                                    <div class="stat-number">4.8</div>
                                    <div class="stat-label">Average Rating</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 PlayStore. All Rights Reserved.</p>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const sidebar = document.querySelector('.sidebar');
            const sidebarToggle = document.querySelector('#sidebarToggle');
            const sidebarOverlay = document.querySelector('#sidebarOverlay');
            const menuItems = document.querySelectorAll('.menu-items li');

            // Toggle sidebar
            function toggleSidebar() {
                sidebar.classList.toggle('active');
                sidebarOverlay.classList.toggle('active');
                
                // Update toggle button icon
                const icon = sidebarToggle.querySelector('i');
                if (sidebar.classList.contains('active')) {
                    icon.classList.remove('fa-bars');
                    icon.classList.add('fa-times');
                } else {
                    icon.classList.remove('fa-times');
                    icon.classList.add('fa-bars');
                }
            }

            // Event listeners
            sidebarToggle.addEventListener('click', toggleSidebar);
            sidebarOverlay.addEventListener('click', toggleSidebar);

            // Close sidebar when menu item is clicked (mobile)
            menuItems.forEach(item => {
                item.addEventListener('click', () => {
                    if (window.innerWidth <= 991) {
                        toggleSidebar();
                    }
                });
            });
        });
    </script>
</body>
</html>
