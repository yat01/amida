# encoding: utf-8
=begin
あみだくじ生成プログラム。okinawa.rbの勉強会での問題。

=end
if ARGV.length < 2
	x=3
	y=7
else
	x=ARGV[0].to_i
	y=ARGV[1].to_i
end
$line = x - 1 #横線を引く列数
$row = y #行数
#この配列に横線を記述
matrix = []
($line*$row).times {|i| matrix[i]=0}
#横線を引く位置を決めるために使う配列
position=[]
$row.times {|i| position[i]=i}
position2=[]
#その列に何本線を引くか決める
def hoge(position)
	return rand(position.length-1)+1 if position.length == $row
	return rand(position.length)+1
end
#横線を引く位置を決める関数
def pos(position, n)
	position2=[]
	n.times do |i|
		j=rand(position.length)
		position2[i]=position[j]
		position.delete_at(j)
	end
	return position2
end
#横線の配列に記録
def record(position2, matrix, i)
	position2.size.times {|j| matrix[position2[j]+(i*$row)]=1}
	return matrix
end
#プログラムの本体（？）
$line.times do |i|
	#その列に何本線を引くか決める
	n=hoge(position-position2)
	#その列のどの位置に線を引くか決める
	position2 = pos(position-position2, n)
	#横線の配列に記録
	matrix=record(position2, matrix, i)
end
#あみだくじ表示
($line+1).times {|i| print ("a".ord+i).chr,"   "}
puts	
$row.times do |i|
	$line.times do |j|
		print "|"
		if matrix[i+(j*$row)] == 0
			print "   "
		else
			print"---"
		end
	end
	print "|"
	puts
end
#当たり表示
hit=rand($line+1)
($line+1).times do |i|
	if hit == i 
		print "*"
		break
	else
		print"    "
	end
end
puts