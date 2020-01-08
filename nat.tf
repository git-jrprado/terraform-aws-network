resource "aws_eip" "nat_eip" {
  count = "${var.multi_nat ? (length(data.aws_availability_zones.available.names) > var.max_az ? var.max_az : length(data.aws_availability_zones.available.names)) : 1}"
  vpc   = true

  tags = "${merge(
    var.tags,
    map(
      "Name", "${var.name}-EIP-${count.index}",
      "EnvName", "${var.name}"
    )
  )}"
}
