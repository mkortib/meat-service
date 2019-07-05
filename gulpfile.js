// Подключаем Gulp и все необходимые библиотеки
var gulp           = require('gulp'),
		gutil          = require('gulp-util' ),
		sass           = require('gulp-sass'),
		browserSync    = require('browser-sync'),
		cleanCSS       = require('gulp-clean-css'),
		concat        = require('gulp-concat'),
		notify        = require("gulp-notify"),
		// ftp            = require('vinyl-ftp'),
		autoprefixer   = require('gulp-autoprefixer');

// Обновление страниц сайта на локальном сервере
gulp.task('browser-sync', function() {
	browserSync({
		proxy: "meat-servise",
		notify: false
	});
});

// Компиляция stylesheet.css
gulp.task('sass', function() {
	return gulp.src('catalog/view/theme/meat-service/stylesheet/stylesheet.sass')
		.pipe(sass({ outputStyle: 'expanded' }).on("error", notify.onError()))
		.pipe(autoprefixer(['last 15 versions']))
		.pipe(cleanCSS())
		.pipe(gulp.dest('catalog/view/theme/meat-service/stylesheet/'))
		.pipe(browserSync.reload({stream: true}))
});

gulp.task('js', function() {
	return gulp.src([
		'catalog/view/theme/meat-service/libs/viewport-checker/jquery.viewportchecker.min.js',
		'catalog/view/theme/meat-service/libs/fullpage/fullpage.min.js',
		'catalog/view/theme/meat-service/libs/slick-carousel/slick/slick.min.js',
		'catalog/view/theme/meat-service/libs/anime.js/anime.min.js',
		'catalog/view/theme/meat-service/libs/jQuery-Mask-Plugin-master/dist/jquery.mask.min.js',
		// 'catalog/view/theme/meat-service/libs/smooth-scrollbar/smooth-scrollbar.js',
		'catalog/view/theme/meat-service/js/theme.js' // always at the end
		])
	.pipe(concat('theme.min.js'))
	// .pipe(uglify()) // Mifify js (opt.)
	.pipe(gulp.dest('catalog/view/theme/meat-service/js/'))
	.pipe(browserSync.reload({ stream: true }));
});

// Наблюдение за файлами

gulp.task('watch', ['sass', 'js', 'browser-sync'], function() {
	gulp.watch('catalog/view/theme/meat-service/stylesheet/stylesheet.sass', ['sass']);
	gulp.watch('catalog/view/theme/meat-service/js/theme.js', ['js']);
	gulp.watch('catalog/view/theme/meat-service/template/**/*.tpl', browserSync.reload);
	// gulp.watch('catalog/view/theme/meat-service/js/**/*.js', browserSync.reload);
	gulp.watch('catalog/view/theme/meat-service/libs/**/*', browserSync.reload);
});
// Выгрузка изменений на хостинг
gulp.task('deploy', function() {
	var conn = ftp.create({
		host:      'hostname.com',
		user:      'username',
		password:  'userpassword',
		parallel:  10,
		log: gutil.log
	});
	var globs = [
	'catalog/view/theme/meat-service/**'
	];
	return gulp.src(globs, {buffer: false})
	.pipe(conn.dest('/path/to/folder/on/server'));
});

gulp.task('default', ['watch']);